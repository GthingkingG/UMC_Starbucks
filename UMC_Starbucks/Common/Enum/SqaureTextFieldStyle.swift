//
//  SqaureTextFieldStyle.swift
//  UMC_Starbucks
//
//  Created by Air on 8/1/25.
//

import SwiftUI

struct SquareTextfieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            Rectangle()
                .foregroundStyle(Color.clear)
                .border(Color.gray01)
                .frame(height: 30)
            
            configuration
                .font(.mainTextRegular13)
                .foregroundStyle(Color.gray03)
                .padding(.horizontal)
        }
    }
}
