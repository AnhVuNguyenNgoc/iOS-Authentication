//
//  ContentView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var currentView: AppView
    
    var body: some View {
        
        switch currentView {
        case .splash:
            SplashScreen(currentView: $currentView)
        case .onboarding:
            OnboardingView(currentView: $currentView)
        case .login:
            LoginView(currentView: $currentView)
        case .home:
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentView: .constant(.splash))
                   .previewDisplayName("Splash Screen Preview")
        ContentView(currentView: .constant(.onboarding))
                   .previewDisplayName("Onboarding Screen Preview")
        ContentView(currentView: .constant(.home))
                   .previewDisplayName("Login Screen Preview")
               HomeView()
                   .previewDisplayName("Home View Preview")
    }
}
