//
//  AuthenticationFlowApp.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

@main
struct AuthenticationFlowApp: App {
    @ObservedObject var authManager = AuthNetworkManager()
    
    var body: some Scene {
        WindowGroup {
          
            if authManager.isAuthenticated {
                HomeView()
            } else {
                Login()
            }

        }
    }
}
