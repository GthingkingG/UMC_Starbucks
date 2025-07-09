//
//  OCRViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/24/25.
//

import SwiftUI
import Vision

@Observable
class ReceiptViewModel: ImageHandling {
    var images: [UIImage] = []
    var recognizedText: String = ""
    var currentReceipt: ReceiptModel?
    
    func addImage(_ image: UIImage) {
        images.append(image)
        performOCR(on: image)
    }
    
    func removeImage(at index: Int) {
        guard images.indices.contains(index) else { return }
        images.remove(at: index)
    }
    
    func getImages() -> [UIImage] {
        images
    }
    
    private func performOCR(on uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else {
            self.currentReceipt = nil
            return
        }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation], error == nil else {
                self?.currentReceipt = nil
                return
            }
            
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            let parsed = self.parseWithoutRegex(from: fullText)
            parsed.image = uiImage.pngData()
            
            DispatchQueue.main.async {
                self.currentReceipt = parsed
            }
        }
        
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR", "en-US"]

        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }
    
    private func parseWithoutRegex(from text: String) -> ReceiptModel {
        let lines = text.components(separatedBy: .newlines)
        
        var store = "장소 없음"
        var totalAmount = 0
        var date = "날짜 없음"
        
        var i = 0
        
        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
//            print("🔹 [\(i)] \(trimmed)")
            
            if trimmed.range(of: "([0-9]{4})\\-([0-9]{2})\\-([0-9]{2})", options: .regularExpression) != nil, i < 15 {
                var dateString = trimmed
                let index = trimmed.index(trimmed.startIndex, offsetBy: 10)
                if dateString[index] != " " {
                    dateString.insert(" ", at: index)
                }
                let firstString = (dateString.components(separatedBy: " ").first ?? "2000.01.01").replacingOccurrences(of: "-", with: ".")
                let secondString = (dateString.components(separatedBy: " ")[1]).dropLast(3)
                date = firstString + " " + secondString
            }
                
            
            if store == "장소 없음", trimmed.contains("점") {
                store = trimmed
            }
        
            
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                }
            }
            i += 1
        }
        
        return ReceiptModel(
            store: store,
            totalAmount: totalAmount,
            date: date
        )
    }
}
