//
//  SignupView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct SignupView: View {
    @State var signupInfo: SignupModel
    
    let keychain = KeychainService.shared
    
    @AppStorage("nickName") private var nickName = ""
    private var emailAddress = ""
    private var emailPassword = ""
    
    @Environment(\.dismiss) var dismiss
    
    
    init(signupInfo: SignupModel) {
        self.signupInfo = signupInfo
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 49) {
                makeTextfield(defaultText: "닉네임", text: $signupInfo.nickName)
                makeTextfield(defaultText: "이메일", text: $signupInfo.emailAddress)
                makeTextfield(defaultText: "비밀번호", text: $signupInfo.emailPassword)
            }
            
            Spacer()
            
            Button(action: {
                if isButtonActive() {
                    saveInfo()
                    saveStatus()
                    print("\(signupInfo.nickName)\n\(signupInfo.emailAddress)\n\(signupInfo.emailPassword)")
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
    
    func saveInfo() {
        nickName = signupInfo.nickName
    }
    
    func isButtonActive() -> Bool {
        return !(signupInfo.nickName.isEmpty || signupInfo.emailAddress.isEmpty || signupInfo.emailPassword.isEmpty)
    }
    
    func navigationItemView(icon: String) -> some View {
        Image(systemName: icon)
            .foregroundStyle(Color.black)
    }
    
    func saveStatus() {
        let saveStatus = keychain.savePasswordToKeychain(account: signupInfo.emailAddress, service: "com.MyApp.login", password: signupInfo.emailPassword)
        if saveStatus == errSecSuccess {
            print("비밀번호 저장 성공")
        } else {
            print("비밀번호 저장 실패", saveStatus)
        }
    }
    
}



#Preview {
    SignupView(signupInfo: .init(nickName: "", emailAddress: "", emailPassword: ""))
}
