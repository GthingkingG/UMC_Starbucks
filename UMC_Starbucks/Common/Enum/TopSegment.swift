//
//  TopSegment.swift
//  UMC_Starbucks
//
//  Created by Air on 6/30/25.
//

import Foundation

enum TopSegment: CaseIterable {
    case total, mine, cake
    
    var title: String {
        switch self {
        case .total:
            return "전체 메뉴"
        case .mine:
            return "나만의 메뉴"
        case .cake:
            return "홀케이크 예약"
        }
    }
    
    var isCake: Bool {
        switch self {
        case .cake:
            return true
        default:
            return false
        }
    }
    
    var index: Int {
        switch self {
        case .total:
            return 0
        case .mine:
            return 1
        case .cake:
            return 2
        }
    }

}
