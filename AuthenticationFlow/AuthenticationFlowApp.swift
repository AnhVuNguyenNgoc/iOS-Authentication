//
//  AuthenticationFlowApp.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

@main
struct AuthenticationFlowApp: App {

    @StateObject var navigationManager = NavigationManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(navigationManager)
        }
    }
}
