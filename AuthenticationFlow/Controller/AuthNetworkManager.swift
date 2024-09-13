//
//  AuthNetworkManager.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import Foundation
import Combine

class AuthNetworkManager : ObservableObject {
    @Published var isAuthenticated: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        // Check if the user is already logged in
        isAuthenticated = TokenManager.shared.isLoggedIn()
    }
    
    
    func login(username: String, password: String){
        
          // Log the username and password (be cautious with logging sensitive information)
          print("Attempting to log in with username: \(username)")

          guard let url = URL(string: "https://dummyjson.com/auth/login") else {
              print("Invalid URL")
              return
          }
          
          let body: [String: Any] = ["username": username, "password": password]
          let jsonData = try? JSONSerialization.data(withJSONObject: body)
          
          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          request.httpBody = jsonData
          
          // Log the request details
          print("Request URL: \(url)")
          print("Request Body: \(String(data: jsonData ?? Data(), encoding: .utf8) ?? "No Body")")
          
          URLSession.shared.dataTaskPublisher(for: request)
              .map { $0.data }
              .receive(on: DispatchQueue.main) // Ensure updates are on the main thread
              .decode(type: AuthResponse.self, decoder: JSONDecoder())
              .sink(receiveCompletion: { completion in
                  switch completion {
                  case .finished:
                      print("Login request finished successfully.")
                  case .failure(let error):
                      print("Login request failed with error: \(error.localizedDescription)")
                      self.isAuthenticated = false
                  }
              }, receiveValue: { response in
                  print("Login successful, received token: \(response.token)")
                  TokenManager.shared.token = response.token
                  self.isAuthenticated = true
              })
              .store(in: &cancellables)
      
        
    }
    
    func logout() {
        TokenManager.shared.clearToken() // Clear the token on logout
        isAuthenticated = false
    }
    
}

struct AuthResponse: Codable {
    let token: String
}
