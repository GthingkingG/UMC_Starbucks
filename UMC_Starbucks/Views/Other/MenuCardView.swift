//
//  MenuCardView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//

import SwiftUI

struct MenuCardView: View {
    @Binding var path: NavigationPath
    
    let title: String
    let image: String
    
    var body: some View {
        Button(action: {
            print(title)
            path.append(title)
        }, label: {
            HStack(spacing: 4) {
                Image(image)
                    .foregroundStyle(Color.gray06)
                Text(title)
                    .font(.mainTextSemibold16)
                    .foregroundStyle(Color.black02)
            }
            .frame(width: 157, alignment: .leading)
        })
    }
}
