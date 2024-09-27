//
//  AuthenticationFlowApp.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI


enum AppView {
    case splash
    case onboarding
    case login
    case home
}

@main
struct AuthenticationFlowApp: App {
    @State private var currentView: AppView = .splash
    
    @StateObject var navigationManager = NavigationManager()
    var body: some Scene {
        WindowGroup {
            ContentView(currentView: $currentView).environmentObject(navigationManager)
        }
    }
}
