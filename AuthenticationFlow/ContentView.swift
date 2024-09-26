//
//  ContentView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSplashActive = true // State variable to control splash screen
    @ObservedObject var authManager = AuthNetworkManager()
    
    @State private var captureImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    private let delaySplashScreen: DispatchTime = .now() + 2
    
//    @State private var selection: Int = 2
    @EnvironmentObject var navigationManager: NavigationManager
    
    
    var body: some View {
        if isSplashActive {
            Splashscreen()
                .onAppear {
                    // Simulate a loading delay
                    DispatchQueue.main.asyncAfter(deadline: delaySplashScreen) { // Adjust duration as needed
                        withAnimation {
                            isSplashActive = false // Transition to main content
                        }
                    }
                }
        } else {
//            // Main content of your app
            
            OnboardingView()
//            if authManager.isAuthenticated {
//                TabView(selection: $navigationManager.selection){
//                    HomeView()
//                        .tabItem {
//                            Image(systemName: "house")
//                                .renderingMode(.template)
//                                .foregroundColor(.green)
//                        }
//                        .tag(1)
//
//                    SearchView()
//                        .tabItem {
//                            Image(systemName: "magnifyingglass")
//                        }
//                        .tag(2)
//
//
//                    NavigationView {
//                        CameraCapturedView(captureImage: $captureImage, isCustomCameraViewPresented: $isCustomCameraViewPresented)
//                    }
//                    .tabItem {
//                        Image(systemName: "camera.circle.fill")
//                            .renderingMode(.template)
////                            .foregroundColor(Color(hex: "91C788"))
//                            .background(Color.red)
//
//                    }.tag(3)
//
//                    Text("Favorites")
//                        .tabItem {
//                            Image(systemName: "heart")
//                        }.tag(4)
//                        .background(Color.red)
//
//                    Text("Profile")
//                        .tabItem {
//                            Image(systemName: "person.circle.fill")
//                                .renderingMode(.template)
//                                .foregroundColor(.pink)
//                        }.tag(5)
//                }
                //                    ContentView()
//            } else {
//                Login()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
            .environmentObject(NavigationManager())
    }
}
