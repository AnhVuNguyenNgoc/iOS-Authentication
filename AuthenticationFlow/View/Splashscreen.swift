//
//  Splashscreen.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

struct Splashscreen: View {
    var body: some View {
        ZStack{
            // Background color
            Color(hex: "#91C788")
               .ignoresSafeArea() // This makes the color fill the entire screen
            
            Image("background-splash-screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .trailing) {
                Image("Logo")
                
                Text("ANH VU").font(.largeTitle)
           }
        }
     
    }
}

struct Splashscreen_Previews: PreviewProvider {
    static var previews: some View {
        Splashscreen()
    }
}

extension Color {
    init?(hex: String) {
        // Remove the hash if it exists
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgb: UInt64 = 0
        
        // Check if the hex string is valid
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.scanLocation = 1 // Skip the '#'
        }
        
        if scanner.scanHexInt64(&rgb) {
            let red = Double((rgb >> 16) & 0xFF) / 255.0
            let green = Double((rgb >> 8) & 0xFF) / 255.0
            let blue = Double(rgb & 0xFF) / 255.0
            self.init(red: red, green: green, blue: blue)
            return
        }
        
        return nil
    }
}
