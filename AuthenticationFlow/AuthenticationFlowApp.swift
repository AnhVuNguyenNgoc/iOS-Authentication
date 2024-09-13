//
//  AuthenticationFlowApp.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

@main
struct AuthenticationFlowApp: App {
    @State private var isSplashActive = true // State variable to control splash screen

    @ObservedObject var authManager = AuthNetworkManager()
    
    var body: some Scene {
        WindowGroup {
            if isSplashActive {
                Splashscreen()
                    .onAppear {
                        // Simulate a loading delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Adjust duration as needed
                            withAnimation {
                                isSplashActive = false // Transition to main content
                            }
                        }
                    }
            } else {
                // Main content of your app
                if authManager.isAuthenticated {
                    HomeView()
                } else {
                    Login()
                }
            }
        }
    }
}
