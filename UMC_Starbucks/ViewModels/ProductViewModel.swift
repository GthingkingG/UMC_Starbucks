//
//  ProductViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import Foundation

@Observable
class ProductViewModel {
    let productModels: [ProductModel] = [
        ProductModel(title: "그린 사이렌 도트 머그 \n237ml", image: "dotMug"),
        ProductModel(title: "그린 사이렌 도트 머그 \n355ml", image: "dotMug355"),
        ProductModel(title: "홈 카페 미니 머그 세트", image: "mugSet"),
        ProductModel(title: "홈 카페 글라스 세트", image: "glassSet")
    ]
    
    
}
