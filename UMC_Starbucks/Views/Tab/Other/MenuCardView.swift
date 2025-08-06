//
//  MenuCardView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//

import SwiftUI

struct MenuCardView: View {
    @Bindable var router: NavigationRouter
    
    let title: String
    let image: String
    
    var body: some View {
        Button(action: {
            router.push(.mapInfo)
            
        }, label: {
            HStack(spacing: 4) {
                Image(image)
                    .foregroundStyle(Color.gray06)
                Text(title)
                    .font(.mainTextSemibold16)
                    .foregroundStyle(Color.black02)
            }
            .padding(.vertical, 16)
        })
    }
}
