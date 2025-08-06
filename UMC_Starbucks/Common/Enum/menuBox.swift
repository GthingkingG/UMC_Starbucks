//
//  menuBox.swift
//  UMC_Starbucks
//
//  Created by Air on 7/31/25.
//


enum menuBox: String, CaseIterable {
    case star, receipt, my
    
    var menuTitle: String {
        switch self {
        case .star:
            return "별 히스토리"
        case .receipt:
            return "전자영수증"
        case .my:
            return "나만의 메뉴"
        }
    }
    
    var menuImage: String {
        switch self {
        case .star:
            return "menu.star"
        case .receipt:
            return "menu.receipt"
        case .my:
            return "menu.my"
        }
    }
    
    var menuDestination: Route {
        switch self {
        case .receipt:
            return .receipt
        default:
            return .temp
        }
    }
}
