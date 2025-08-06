//
//  MenuBoxView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//

import SwiftUI

struct MenuBoxView: View {
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 102, height: 108)
                .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
            VStack(spacing: 4) {
                Image(image)
                Text(title)
                    .font(.mainTextSemibold16)
                    .foregroundStyle(Color.black03)
            }
        }
    }
}
