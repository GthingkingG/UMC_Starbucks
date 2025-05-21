//
//  ContentView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
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
    
//    var tabView: some View {
//        switch self {
//        case .home:
//            return Text("home")
//        case .pay:
//            return Text("pay")
//        case .order:
//            return Text("order")
//        case .shop:
//            return Text("shop")
//        case .other:
//            return OtherView()
//        }
//    }
}

struct ContentView: View {
    @State var selection: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(tabType.allCases, id: \.self) { tab in
                    Tab(value: tab.tabIndex, content: {
                        OtherView()
                    }, label: {
                        VStack(spacing: 10) {
                            Image(selection == tab.tabIndex ? tab.tabImage + "On" : tab.tabImage + "Off")
//                                .renderingMode(.template)
                            Text(tab.tabTitle)
                        }
                    })
                }
            }
            .tint(.green02)
        }
    }
    func selectImage() {
        
    }
    
}

#Preview {
    ContentView()
}
