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
    @AppStorage("isAutoLogin") var isAutoLogin: Bool = false
    @State var appFlowVieModel: AppFlowViewModel = .init()
    
    init() {
        let kakaoNativeAppKey = "0428c7cf5d3e15b63bf03233aa3d1846"
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
//            switch model.appSate {
//            case .splash:
//                SplashView()
//            case .login:
//                LoginView()
//            case .tab:
//                ContentView()
//            }
            Group {
                if isAutoLogin {
                    ContentView()
                } else {
                    LoginView()
                        .onOpenURL(perform: { url in
                            if AuthApi.isKakaoTalkLoginUrl(url) {
                                _ = AuthController.handleOpenUrl(url: url)
                            }
                        })
                }
            }
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
