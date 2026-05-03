//
//  LoginView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI
import KakaoSDKUser

struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel
    @FocusState private var focus: FocusType?
    @State var path = NavigationPath()
    @AppStorage("nickName") private var nickName = ""
    @Environment(AppFlowViewModel.self) var appFlowViewModel
    
    let keychain = KeychainService.shared
    
    init() {
        self._loginViewModel = .init(wrappedValue: .init(loginModel: .init(id: "아이디", pwd: "비밀번호")))
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                titleView
                
                Spacer()
                
                loginView
                
                Spacer()
                
                socialLoginView
            }
            .frame(height: 751)
            .safeAreaPadding(.horizontal, 19)
            .navigationDestination(for: String.self) { value in
                SignupView()
            }
        }
    }
    
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 19) {
            Image(.starbucsLogo)
                .resizable()
                .frame(width: 97, height: 95)
            
            Spacer().frame(height: 9)
            
            Text("안녕하세요.\n스타벅스입니다.")
                .font(.mainTextExtraBold24)
                .frame(height: 58, alignment: .leading)
                
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.mainTextMedium16)
                .foregroundStyle(.gray01)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var loginView: some View {
        VStack(alignment: .leading, spacing: 47) {
            
            makeTextfield(text: $loginViewModel.loginModel.id, type: .id)
    
            makeTextfield(text: $loginViewModel.loginModel.pwd, type: .pwd)
            
            Button(action: {
                if isLoggin() {
                    appFlowViewModel.changeAppState(.tab)
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color.green01)
                        .frame(height: 46)
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white01)
                }
            })
                
        }
    }
    
    private var socialLoginView: some View {
        VStack(spacing: 19) {
            Button(action: {
                path.append("Sign")
            }, label: {
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline()
            })
            
            Button(action: {
                kakaoLogin()
            }, label: {
                Image(.kakaoLogin)
            })
            Image(.appleLogin)
        }
        .frame(width: 306)
    }
    
    func makeTextfield(text: Binding<String>, type: FocusType) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            TextField("", text: text)
                .font(.mainTextRegular13)
                .foregroundStyle(Color.black01)
                .focused($focus, equals: type)
            Divider()
                .background(focus == type ? Color.green01 : Color.gray00)
                .padding(.horizontal, 1)
        }
    }
    
    func isLoggin() -> Bool {
        guard let savedUserInfo = keychain.load(key: "Starbucks_One", service: "com.MyApp.login") else {
            print("키체인에 저장된 정보 없음")
            return false
        }
        
        if savedUserInfo.id == loginViewModel.loginModel.id && savedUserInfo.password == loginViewModel.loginModel.pwd {
            appFlowViewModel.changeAppState(.tab)
            return true
        } else {
            print("로그인 실패")
            print(savedUserInfo.id)
            print(savedUserInfo.password)
            print(loginViewModel.loginModel.id)
            print(loginViewModel.loginModel.pwd)
            return false
        }
    }
    
    @MainActor
    func kakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            print("카카오")
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print("에러: \(error)")
                }
                
                appFlowViewModel.changeAppState(.tab)
                
                print("카카오톡 로그인 success")
                UserApi.shared.me { user, error in
                    if let error = error {
                        print("에러: \(error)")
                    }
                    if let user = user {
                        nickName = user.kakaoAccount?.profile?.nickname ?? "앱 오류"
                        appFlowViewModel.changeAppState(.tab)
                    }
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print("에러: \(error)")
                    
                } else {
                    print("카카오 계정 로그인 success")
                    UserApi.shared.me { user, error in
                        if let error = error {
                            print("에러: \(error)")
                        }
                        if let user = user {
                            nickName = user.kakaoAccount?.profile?.nickname ?? "웹 오류"
                            appFlowViewModel.changeAppState(.tab)
                        }
                    }
                }
            }
        }
    }
    
    enum FocusType {
        case id
        case pwd
    }
    
}
