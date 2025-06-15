//
//  DrinkTypeView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/30/25.
//

import SwiftUI

struct DrinkTypeView: View {
    @Binding var isIced: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Capsule()
                    .foregroundStyle(Color.gray07)
                    .frame(width: geometry.size.width, height: 36)
                    .onTapGesture {
                        withAnimation() {
                            isIced.toggle()
                        }
                    }
                HStack {
                    ZStack {
                        Capsule()
                            .foregroundStyle(Color.white)
                            .frame(width: geometry.size.width / 2 , height: 36)
                            .shadow(radius: 5)
                            .offset(x: isIced ? geometry.size.width * 0.5 + 4 : 4)
                        Text("HOT")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(isIced ? Color.gray : Color.red01)
                    }
                    ZStack {
                        Capsule()
                            .fill(.clear)
                            .frame(width: geometry.size.width / 2, height: 36)
                            
                        Text("ICED")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(isIced ? Color.blue01 : Color.gray02)
                    }
                }
            }
            
        }
    }
}
