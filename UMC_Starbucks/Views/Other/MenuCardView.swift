//
//  MenuCardView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//

import SwiftUI

struct MenuCardView: View {
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        Button(action: {
            print(title)
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
