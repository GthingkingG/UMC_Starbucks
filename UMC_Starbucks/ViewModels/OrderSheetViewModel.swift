//
//  OrderSheetViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 7/2/25.
//

import Foundation

@Observable
class OrderSheetViewModel {
    var orderSheetModel: OrderSheetModel?
    
    func loadData(completion: @escaping (Result<OrderSheetModel, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "starbucksData", withExtension: "geojson") else {
            print("json 파일 없음")
            completion(.failure(NSError(domain: "파일 못찾음", code: 404, userInfo: nil)))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(OrderSheetModel.self, from: data)
            self.orderSheetModel = decoded
            print("디코딩 성공")
            completion(.success(decoded))
        } catch {
            print("디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}
