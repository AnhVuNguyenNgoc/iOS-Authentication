//
//  OnboardingView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var currentView: AppView

    private let numberOfPages = 3
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Image("Logo-green")
                
                Sliders(numberOfPages: numberOfPages)
                
                PrimaryButton(text: "Get Started", action: {
                    navigateToLogin = true
                    currentView = .login
                })
                
                HStack(){
                    Text("Already Have An Acount?")
                        .foregroundColor(ColorPalette.Typography.caption)
                    
                    Text("Log in")
                        .foregroundColor(ColorPalette.Primary.baseGreen)
                        .fontWeight(.bold)
                }
                
            }
            
            NavigationLink(
                destination: LoginView(currentView: $currentView),
                isActive: $navigateToLogin,
                label: { EmptyView() }
            )
            
        }
        
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(currentView: .constant(.login))
    }
}
