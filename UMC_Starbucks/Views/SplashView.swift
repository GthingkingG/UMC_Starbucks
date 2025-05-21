//
//  SplashView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI


struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image(.starbucks)
                .frame(width: 168, height: 168)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green01)
    }
}

#Preview {
    SplashView()
}
