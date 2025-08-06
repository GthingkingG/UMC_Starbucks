//
//  RouterModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/26/25.
//

import Foundation

enum Route: Hashable {
    case coffeeDetail(item: HomeModel)
    case receipt
    case mapInfo
    case temp
}
