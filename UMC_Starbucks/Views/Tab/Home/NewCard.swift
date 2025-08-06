//
//  NewCard.swift
//  UMC_Starbucks
//
//  Created by Air on 5/29/25.
//

import SwiftUI

struct NewCard: View {
    var title: String
    var desription: String
    var image: String
    
    var body: some View {
        VStack(spacing: 16, content: {
            Image(image)
            VStack(alignment: .leading, spacing: 9, content: {
                Text(title)
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(Color.black02)
                Text(desription)
                    .font(.mainTextSemiBold13)
                    .foregroundStyle(Color.gray03)
                    .multilineTextAlignment(.leading)
                    .frame(width: 235, height: 36)
            })
        })
    }
}
