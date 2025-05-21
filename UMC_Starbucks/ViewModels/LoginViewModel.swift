//
//  LoginViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginModel: LoginModel
    
    init(loginModel: LoginModel) {
        self.loginModel = loginModel
    }
}
