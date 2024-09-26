//
//  NavigationManager.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import Foundation


class NavigationManager: ObservableObject {
    @Published var selection: Int = 1
    @Published var firstDetailIsShown: Bool = false
    
    @Published var selectedItem: String? = nil
}
