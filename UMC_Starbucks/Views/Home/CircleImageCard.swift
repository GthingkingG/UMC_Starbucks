//
//  CircleImageCard.swift
//  UMC_Starbucks
//
//  Created by Air on 5/28/25.
//

import SwiftUI

struct CircleImageCard: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(image)
            Text(title)
                .foregroundStyle(Color.black02)
                .font(.mainTextSemiBold14)
        }
    }
}
