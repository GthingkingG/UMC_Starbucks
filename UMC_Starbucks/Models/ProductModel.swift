//
//  ProductModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import Foundation

struct ProductModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
}
