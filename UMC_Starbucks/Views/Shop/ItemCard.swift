//
//  ItemCard.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import SwiftUI

struct ItemCard: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("\(image)")
            Text(title)
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold14)
        }
    }
}
