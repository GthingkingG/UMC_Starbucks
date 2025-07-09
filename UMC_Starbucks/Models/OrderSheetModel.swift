//
//  OrderSheetModel.swift
//  UMC_Starbucks
//
//  Created by Air on 7/2/25.
//

import Foundation

struct OrderSheetModel: Codable {
    let type: String
    let name: String
    let features: [Item]
}

struct Item: Codable, Hashable {
    let type: String
    let properties: ItemData
}

struct ItemData: Codable, Hashable {
    var sequence: String
    var storeName: String
    var address: String
    var telephone: String
    var category: String
    var image = "tempImage"
    
    enum CodingKeys: String, CodingKey {
        case sequence = "Seq"
        case storeName = "Sotre_nm"
        case address = "Address"
        case telephone = "Telephone"
        case category = "Category"
    }
}
