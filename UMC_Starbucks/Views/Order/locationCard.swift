//
//  locationCard.swift
//  UMC_Starbucks
//
//  Created by Air on 7/2/25.
//

import SwiftUI

struct locationCard: View {
    var item: ItemData
    
    var body: some View {
        HStack(spacing: 16) {
            Image(item.image)
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(item.storeName)
                        .font(.mainTextSemiBold13)
                        .foregroundStyle(Color.black03)
                    Text(item.address)
                        .font(.mainTextMedium10)
                        .foregroundStyle(Color.gray02)
                }
                HStack {
                    HStack(spacing: 4) {
                        
                        if item.category.contains("리저브 매장") {
                            Image(.reserveOrder)
                            Image(.driveOrder)
                        } else if item.category.contains("DT 매장") {
                            Image(.driveOrder)
                        }
                    }
                    Spacer()
                    Text("\(item.sequence)KM")
                        .font(.mainTextMedium13)
                        .foregroundStyle(Color.black01)
                }
            }
            .padding(.vertical, 6)
        }
    }
}
//
//#Preview {
//    locationCard(item: ItemData(sequence: "qqq", storeName: "wwww", address: "eee", telephone: "rrrr", category: "DT 매장"))
//}
