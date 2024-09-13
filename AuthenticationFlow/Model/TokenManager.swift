//
//  TokenManager.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    
    private let tokenKey = "authToken"
    
    var token: String? {
        get{
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set{
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
    
    func clearToken(){
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    
    func isLoggedIn() -> Bool {
           return token != nil
    }
    
}
