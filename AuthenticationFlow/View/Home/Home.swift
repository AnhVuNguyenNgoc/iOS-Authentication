//
//  Home.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authManager = AuthNetworkManager() // Access the auth manage
    //    @State private var firstDetailIsShown: Bool = false
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Hello, Home View!").font(.largeTitle)
                
                Spacer()
                
                NavigationLink("Go to Detail", destination: HomeDetailListView(), isActive: $navigationManager.firstDetailIsShown)
                //                NavigationLink("Go to detail", destination: HomeDetailListView())
                
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
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(NavigationManager())
    }
}
