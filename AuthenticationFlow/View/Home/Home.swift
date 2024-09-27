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
    
    @State private var captureImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    
    var body: some View {
        NavigationView{
            
            TabView(selection: $navigationManager.selection){
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
                    
                    .tabItem {
                        Image(systemName: "house")
                            .renderingMode(.template)
                            .foregroundColor(.green)
                    }
                    .tag(1)
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .tag(2)
                    
                    
                    NavigationView {
                        CameraCapturedView(captureImage: $captureImage, isCustomCameraViewPresented: $isCustomCameraViewPresented)
                    }
                    .tabItem {
                        Image(systemName: "camera.circle.fill")
                            .renderingMode(.template)
                        //                            .foregroundColor(Color(hex: "91C788"))
                            .background(Color.red)
                        
                    }.tag(3)
                    
                    Text("Favorites")
                        .tabItem {
                            Image(systemName: "heart")
                        }.tag(4)
                        .background(Color.red)
                    
                    Text("Profile")
                        .tabItem {
                            Image(systemName: "person.circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(.pink)
                        }.tag(5)
                }
                
                //                // Navigate to HomeView when authenticated
                //                NavigationLink(destination: Login(currentView: $currentView), isActive: $authManager.isAuthenticated) {
                //                    EmptyView() // This link is hidden
                //                }
                
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
