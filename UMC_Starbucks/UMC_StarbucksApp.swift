//
//  UMC_StarbucksApp.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI
import SwiftData

@main
struct UMC_StarbucksApp: App {
    @AppStorage("isAutoLogin") var isAutoLogin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isAutoLogin {
                ContentView()
            } else {
                LoginView()
            }
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
