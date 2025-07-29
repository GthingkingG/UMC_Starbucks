//
//  SplashView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI


struct SplashView: View {
    
    @Environment(AppFlowViewModel.self) var appFlowViewModel
    let keychain = KeychainService.shared
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(.starbucks)
                .frame(width: 168, height: 168)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green01)
        .task {
            try? await Task.sleep(nanoseconds: 2_500_000_000)
            if keychain.load(key: "Starbucks_One", service: "com.MyApp.login") == nil {
                appFlowViewModel.changeAppState(.login)
            } else {
                appFlowViewModel.changeAppState(.tab)
            }
        }
    }
}

#Preview {
    SplashView()
}
