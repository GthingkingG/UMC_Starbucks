//
//  TestModel.swift
//  UMC_Starbucks
//
//  Created by Air on 7/23/25.
//

import SwiftUI

@Observable
class AppFlowViewModel {
    enum AppState {
        case splash
        case login
        case tab
    }
    
    var appSate: AppState = .splash
    let keychain = KeychainService.shared
    
    func changeAppState(_ newState: AppState) {
        self.appSate = newState
    }
    
    func logout() {
        keychain.delete(key: "Starbucks_One", service: "com.MyApp.login")
        self.appSate = .splash
    }
}
