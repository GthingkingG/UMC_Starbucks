//
//  OrderViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/30/25.
//

import Foundation

@Observable
class OrderViewModel {
    let orderMenues: [OrderModel] = OrderLists.lists
}
