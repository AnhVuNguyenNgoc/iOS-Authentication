//
//  Login.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = "emilys"
    @State private var password: String = "emilyspass"
    @ObservedObject var authManager = AuthNetworkManager()
    
    @Binding var currentView: AppView
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Login") {
                    authManager.login(username: username, password: password)
                    currentView = .home
                }
                .padding()
                
                
                
              // Navigate to HomeView when authenticated
              NavigationLink(destination: HomeView(), isActive: $authManager.isAuthenticated) {
                  EmptyView() // This link is hidden
              }
                
                
                if !authManager.isAuthenticated {
                    Text("Login Failed").foregroundColor(.red)
                    
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(currentView: .constant(.home))
    }
}
