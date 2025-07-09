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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
