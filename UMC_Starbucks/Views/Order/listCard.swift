//
//  listCard.swift
//  UMC_Starbucks
//
//  Created by Air on 7/1/25.
//

import SwiftUI

struct listCard: View {
    var item: OrderModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(item.image)
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 0) {
                    Text(item.title)
                        .font(.mainTextSemibold16)
                        .foregroundStyle(Color.gray06)
                    if item.isRecommended {
                        Image(.dot)
                    }
                }
                Text(item.description)
                    .font(.mainTextSemiBold13)
                    .foregroundStyle(Color.gray03)
            }
            Spacer()
        }
        .padding(.leading, 23)
    }
}
