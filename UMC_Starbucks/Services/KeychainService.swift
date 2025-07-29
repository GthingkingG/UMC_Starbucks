//
//  KeychainService.swift
//  UMC_Starbucks
//
//  Created by Air on 7/11/25.
//

import Foundation
import Security

class KeychainService {
    
    static let shared = KeychainService()
    
    let service: String = "com.MyApp.login"
    let key: String = "Starbucks_One"
    
    @discardableResult
    func savePasswordToKeychain(key: String, service: String, userInfo: UserInfo) -> OSStatus {
        do {
            let data = try JSONEncoder().encode(userInfo)
            
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecAttrService as String: service,
                kSecValueData as String: data,
                kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
            ]
            
            SecItemDelete(query as CFDictionary)
            
            let status = SecItemAdd(query as CFDictionary, nil)
            return status
        } catch {
            print("JSON 인코딩 실패", error)
            return errSecParam
        }
    }
    
    @discardableResult
    func load(key: String, service: String) -> UserInfo? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess, let data = item as? Data else {
            print("Keychain load 실패 - status: \(status)")
            return nil
        }
        
        do {
            return try JSONDecoder().decode(UserInfo.self, from: data)
        } catch {
            print("JSON 디코딩 실패:", error)
            return nil
        }
    }
    
    @discardableResult
    func delete(key: String, service: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrService as String: service
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status == errSecSuccess {
            print("Keychain 삭제 성공 - [\(service) : \(key)]")
        } else if status == errSecItemNotFound {
            print("Keychain 항목 없음 - [\(service) : \(key)]")
        } else {
            print("Keychain 삭제 실패 - status: \(status)")
        }
        
        return status
    }
    
    func saveUserInfo(_ userInfo: UserInfo) {
        let saveStatus = self.savePasswordToKeychain(key: key, service: service, userInfo: userInfo)
        print(saveStatus == errSecSuccess ? "저장 성공" : "저장 실패")
    }
    
    func loadUserInfo() {
        if let loadedUserInfo = self.load(key: key, service: service) {
            print(loadedUserInfo.id)
            print(loadedUserInfo.password)
        } else {
            print("토큰 정보 없음")
        }
    }
    
    func deleteUserInfo() {
        let deleteStatus = self.delete(key: key, service: service)
        print(deleteStatus == errSecSuccess ? "삭제 성공" : "삭제 실패")
    }
}
