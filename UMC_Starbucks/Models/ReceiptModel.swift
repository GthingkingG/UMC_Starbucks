//
//  ReceiptModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/24/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class ReceiptModel {
    @Attribute(.unique) var id: UUID
    
    var store: String
    var totalAmount: Int
    var date: String
    var createdAt: Date
    var image: Data?
    
    init(store: String, totalAmount: Int, date: String, createdAt: Date = Date(), image: Data? = nil) {
        self.id = UUID()
        self.store = store
        self.totalAmount = totalAmount
        self.date = date
        self.createdAt = createdAt
    }
}
