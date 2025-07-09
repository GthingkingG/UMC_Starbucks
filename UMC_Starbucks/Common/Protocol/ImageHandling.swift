//
//  ImageHandling.swift
//  UMC_Starbucks
//
//  Created by Air on 6/23/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
