//
//  HotOnlyView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/30/25.
//

import SwiftUI

struct HotOnlyView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Capsule()
                    .foregroundStyle(Color.white)
                    .frame(width: geometry.size.width, height: 36)
                    .overlay(content: {
                        Capsule()
                            .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
                    })
                Text("HOT ONLY")
                    .font(.mainTextBold16)
                    .foregroundStyle(Color.red01)
            }
            
        }
    }  
}
