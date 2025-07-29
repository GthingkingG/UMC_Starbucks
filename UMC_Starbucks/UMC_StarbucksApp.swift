//
//  UMC_StarbucksApp.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI
import SwiftData
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct UMC_StarbucksApp: App {
    @State var appFlowVieModel: AppFlowViewModel = .init()
    
    init() {
        let kakaoNativeAppKey = "0428c7cf5d3e15b63bf03233aa3d1846"
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            switch appFlowVieModel.appSate {
            case .splash:
                SplashView()
                    .environment(appFlowVieModel)
            case .login:
                LoginView()
                    .environment(appFlowVieModel)
                    .onOpenURL(perform: { url in
                        if AuthApi.isKakaoTalkLoginUrl(url) {
                            _ = AuthController.handleOpenUrl(url: url)
                        }
                    })
            case .tab:
                ContentView()
                    .modelContainer(for: ReceiptModel.self)
            }
        }
    }
}
