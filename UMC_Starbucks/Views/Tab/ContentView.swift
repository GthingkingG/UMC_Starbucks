//
//  ContentView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 0
    @State var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                TabView(selection: $selection) {
                    ForEach(tabType.allCases, id: \.self) { tab in
                        Tab(value: tab.tabIndex, content: {
                            tab.showView(router: router)
                        }, label: {
                            VStack(spacing: 10) {
                                Image(selectImage(selection: selection, tab: tab))
                                Text(tab.tabTitle)
                            }
                            .tag(tab)
                        })
                    }
                }
                .tint(.green02)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .coffeeDetail(let item):
                        CoffeeDetailView(item: item)
                    case .receipt:
                        ReceiptView()
                    case .mapInfo:
                        MapInfoView()
                    case .temp:
                        EmptyView()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    func selectImage(selection: Int, tab: tabType) -> String {
        return selection == tab.tabIndex ? tab.tabImage + "On" : tab.tabImage + "Off"
    }
    
}

#Preview {
    ContentView()
}
