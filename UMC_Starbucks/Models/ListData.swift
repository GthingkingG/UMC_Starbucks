//
//  ListData.swift
//  UMC_Starbucks
//
//  Created by Air on 8/7/25.
//

import Foundation

struct ListData: Codable {
    let documents: [Document]
}

struct Document: Codable, Hashable {
    let place: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case place = "place_name"
        case address = "address_name"
    }
}
