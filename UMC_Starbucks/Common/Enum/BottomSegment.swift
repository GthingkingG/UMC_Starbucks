//
//  BottomSegment.swift
//  UMC_Starbucks
//
//  Created by Air on 6/30/25.
//

import Foundation

enum BottomSegment: CaseIterable {
    case beverage, food, item
    
    var title: String {
        switch self {
        case .beverage:
            return "음료"
        case .food:
            return "푸드"
        case .item:
            return "상품"
        }
    }
    
    var index: Int {
        switch self {
        case .beverage:
            return 0
        case .food:
            return 1
        case .item:
            return 2
        }
    }
}
