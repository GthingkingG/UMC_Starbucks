//
//  SignupView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct SignupView: View {
    @State var signupInfo: SignupModel
    @AppStorage("nickName") private var nickName: String = ""
    @AppStorage("emailAddress") private var emailAddress: String = ""
    @AppStorage("emailPassword") private var emailPassword: String = ""
    
    init(signupInfo: SignupModel) {
        self.signupInfo = signupInfo
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 49) {
                makeTextfield(defaultText: "닉네임", text: $signupInfo.nickName)
                makeTextfield(defaultText: "이메일", text: $signupInfo.emailAddress)
                makeTextfield(defaultText: "비밀번호", text: $signupInfo.emailPassword)
//                Spacer()
//                Text(nickName)
//                Text(emailAddress)
//                Text(emailPassword)
            }
            Spacer()
            Button(action: {
                saveInfo()
            }, label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 58)
                    .foregroundStyle(Color.green01)
                    .overlay(content: {
                        Text("생성하기")
                            .foregroundStyle(Color.white01)
                            .font(.makeMedium18)
                    })
            })
        }.padding(.horizontal, 19)
            .padding(.top, 210)
            .padding(.bottom, 72)
    }
        
    func makeTextfield(defaultText: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            TextField("\(defaultText)", text: text)
                .font(.mainTextRegular18)
                .foregroundStyle(Color.black01)
            Divider()
        }
    }
    
    func saveInfo() {
        nickName = signupInfo.nickName
        emailAddress = signupInfo.emailAddress
        emailPassword = signupInfo.emailPassword
    }
}
    


#Preview {
    SignupView(signupInfo: .init(nickName: "", emailAddress: "", emailPassword: ""))
}
