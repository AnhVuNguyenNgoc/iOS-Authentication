//
//  Home.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authManager = AuthNetworkManager() // Access the auth manage
    
    var body: some View {
        VStack{
            Text("Hello, Home View!").font(.largeTitle)
            
            Spacer()
            
            Button("Logout") {
                          authManager.logout() // Call logout method
                      }
                      .padding()
            
            // Navigate to HomeView when authenticated
            NavigationLink(destination: Login(), isActive: $authManager.isAuthenticated) {
                EmptyView() // This link is hidden
            }
              
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
