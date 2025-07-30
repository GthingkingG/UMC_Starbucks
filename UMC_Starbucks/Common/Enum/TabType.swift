//
//  TabType.swift
//  UMC_Starbucks
//
//  Created by Air on 7/30/25.
//

import SwiftUI

enum tabType: String, CaseIterable {
    case home, pay, order, shop, other
    
    var tabIndex: Int {
        switch self {
        case .home:
            return 0
        case .pay:
            return 1
        case .order:
            return 2
        case .shop:
            return 3
        case .other:
            return 4
        }
    }
    
    var tabTitle: String {
        switch self {
        case .home:
            return "Home"
        case .pay:
            return "Pay"
        case .order:
            return "Order"
        case .shop:
            return "Shop"
        case .other:
            return "Other"
        }
    }
    
    var tabImage: String {
        switch self {
        case .home:
            return "tab.home"
        case .pay:
            return "tab.pay"
        case .order:
            return "tab.order"
        case .shop:
            return "tab.shop"
        case .other:
            return "tab.other"
        }
    }
    
    @ViewBuilder
    func showView() -> some View {
        switch self {
        case .home:
            HomeView()
        case .pay:
            Text("Pay")
        case .order:
            OrderView()
        case .shop:
            ShopView()
        case .other:
            OtherView()
        }
    }
}
