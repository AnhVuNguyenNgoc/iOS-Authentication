//
//  ContentView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var authManager = AuthNetworkManager()
    
    var body: some View {
        VStack {
                   TextField("Username", text: $username)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   
                   SecureField("Password", text: $password)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   
                   Button("Login") {
                       print("Login press")
                       authManager.login(username: username, password: password)
                   }
                   .padding()
                   
                   if authManager.isAuthenticated {
                       Text("Login Successful!")
                   } else {
                       Text("Login Failed").foregroundColor(.red)
                   }
               }
               .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
