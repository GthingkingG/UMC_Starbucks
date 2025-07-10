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
    
    @discardableResult
    func savePasswordToKeychain(account: String, service: String, password: String) -> OSStatus {
        guard let passwordData = password.data(using: .utf8) else {
            return errSecParam
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecValueData as String: passwordData,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status
    }
    
    @discardableResult
    func load(account: String, service: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else {
            print("Keychain load 실패 - status: \(status)")
            return nil
        }
        
        guard let data = item as? Data,
              let result = String(data: data, encoding: .utf8) else {
            print("Keychain load 실패 - 데이터 디코딩 실패")
            return nil
        }
        
        return result
    }
    
    @discardableResult
    func delete(account: String, service: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status == errSecSuccess {
            print("Keychain 삭제 성공 - [\(service) : \(account)]")
        } else if status == errSecItemNotFound {
            print("Keychain 항목 없음 - [\(service) : \(account)]")
        } else {
            print("Keychain 삭제 실패 - status: \(status)")
        }
        
        return status
    }
}
