//
//  PopupView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//

import SwiftUI

struct PopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 106) {
            Image(.advertisement)
                .resizable()
                .frame(height: 720)
            
            VStack(alignment: .trailing, spacing: 19) {
                Button(action: {
                    print("자세히 보기")
                }, label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 58)
                        .foregroundStyle(Color.green01)
                        .overlay(content: {
                            Text("자세히 보기")
                                .foregroundStyle(Color.white01)
                                .font(.makeMedium18)
                        })
                })
                
                Button(action: {
                    dismiss()
                }, label: {
                    Label("닫기", systemImage: "xmark")
                        .font(.mainTextLight14)
                        .foregroundStyle(Color.gray05)

                })
                .padding(.trailing, 19)
            }
            .padding(.horizontal, 18)
        }
        .padding(.bottom, 36)
        .ignoresSafeArea()
    }
}

#Preview {
    PopupView()
}
