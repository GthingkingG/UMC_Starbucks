//
//  SignupView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct SignupView: View {
    @State var signUpViewModel = SignupViewModel()
    
    let keychain = KeychainService.shared
    
    @AppStorage("nickName") private var nickName = ""
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            VStack(spacing: 49) {
                makeTextfield(defaultText: "닉네임", text: $signUpViewModel.singupModel.nickName)
                makeTextfield(defaultText: "이메일", text: $signUpViewModel.singupModel.emailAddress)
                makeTextfield(defaultText: "비밀번호", text: $signUpViewModel.singupModel.emailPassword)
            }
            
            Spacer()
            
            Button(action: {
                if isButtonActive() {
                    saveNickName()
                    saveStatus()
                    print("\(signUpViewModel.singupModel.nickName)\n\(signUpViewModel.singupModel.emailAddress)\n\(signUpViewModel.singupModel.emailPassword)")
                    dismiss()
                } else {
                    print("빈 칸이 있음")
                }
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
        }
        .frame(height: 674)
        .padding(.horizontal, 19)
        .padding(.top, 152)
        .navigationTitle("가입하기")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading, content: {
                Button(action: {
                    dismiss()
                }) {
                    navigationItemView(icon: "chevron.left")
                }
            })
        }
    }
    
    func makeTextfield(defaultText: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            TextField("\(defaultText)", text: text)
                .font(.mainTextRegular18)
                .foregroundStyle(Color.black01)
            Divider()
        }
    }
    
    func saveNickName() {
        nickName = signUpViewModel.singupModel.nickName
    }
    
    func isButtonActive() -> Bool {
        return !(signUpViewModel.singupModel.nickName.isEmpty || signUpViewModel.singupModel.emailAddress.isEmpty || signUpViewModel.singupModel.emailPassword.isEmpty)
    }
    
    func navigationItemView(icon: String) -> some View {
        Image(systemName: icon)
            .foregroundStyle(Color.black)
    }
    
    func saveStatus() {
        let saveStatus = keychain.savePasswordToKeychain(key: "Starbucks_One", service: "com.MyApp.login", userInfo: .init(id: signUpViewModel.singupModel.emailAddress  , password: signUpViewModel.singupModel.emailPassword))
        if saveStatus == errSecSuccess {
            print("저장 성공")
        } else {
            print("저장 실패", saveStatus)
        }
    }
    
}

#Preview {
    SignupView()
}
