//
//  TestModel.swift
//  UMC_Starbucks
//
//  Created by Air on 7/23/25.
//

import Foundation

@Observable
class AppFlowViewModel {
    enum AppState {
        case splash
        case login
        case tab
    }
    
    var appSate: AppState = .splash
    
    
    func changeAppState(change: AppState) {
        self.appSate = .login
    }
    
}
