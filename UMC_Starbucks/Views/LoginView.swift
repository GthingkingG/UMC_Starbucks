//
//  LoginView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel
    
    @FocusState private var focus: FocusType?
    
    @State var router = NavigationRouter()
    
    @AppStorage("emailAddress") private var emailAddress: String = ""
    @AppStorage("emailPassword") private var emailPassword: String = ""
    
    init() {
        self._loginViewModel = .init(wrappedValue: .init(loginModel: .init(id: "아이디", pwd: "비밀번호")))
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                titleView
                
                Spacer()
                
                loginView
                
                Spacer()
                
                socialLoginView
            }
            .frame(height: 751)
            .safeAreaPadding(.horizontal, 19)
            .navigationDestination(for: Route.self) {
                route in
                switch route {
                case .login:
                    LoginView()
                case .emailSignUp:
                    SignupView(signupInfo: .init(nickName: "", emailAddress: "", emailPassword: ""))
                case .tab:
                    Text("QQ")
                }
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
                    router.reset()
                    router.push(.tab)
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
                router.push(.emailSignUp)
            }, label: {
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline()
            })
            
            
            Image(.kakaoLogin)
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
        if loginViewModel.loginModel.id == emailAddress && loginViewModel.loginModel.pwd == emailPassword {
            return true
        } else {
            return false
        }
    }
    
    enum FocusType {
        case id
        case pwd
    }
    
}

#Preview {
    LoginView()
}
