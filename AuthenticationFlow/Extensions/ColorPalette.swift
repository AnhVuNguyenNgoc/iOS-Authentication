//
//  ColorPalette.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import Foundation
import SwiftUI


struct ColorPalette {
    struct Primary {
        static let baseGreen = Color(red: 0.64, green: 0.76, blue: 0.58)
        static let lightGreen100 = Color(red: 0.90, green: 0.96, blue: 0.90)
        static let lightGreen250 = Color(red: 0.82, green: 0.91, blue: 0.82)
        static let lightGreen400 = Color(red: 0.73, green: 0.87, blue: 0.73)
        static let darkGreen600 = Color(red: 0.42, green: 0.56, blue: 0.42)
        static let darkGreen750 = Color(red: 0.30, green: 0.42, blue: 0.30)
        static let darkGreen900 = Color(red: 0.18, green: 0.28, blue: 0.18)
    }
    
    struct Secondary {
        static let baseRed = Color(red: 0.95, green: 0.55, blue: 0.51)
        static let lightRed100 = Color(red: 0.99, green: 0.93, blue: 0.93)
        static let lightRed250 = Color(red: 0.99, green: 0.85, blue: 0.85)
        static let lightRed400 = Color(red: 0.98, green: 0.72, blue: 0.72)
        static let darkRed600 = Color(red: 0.77, green: 0.29, blue: 0.29)
        static let darkRed750 = Color(red: 0.61, green: 0.18, blue: 0.18)
        static let darkRed900 = Color(red: 0.43, green: 0.12, blue: 0.12)
    }
    
    struct Typography {
           static let title = Color(red: 0.0, green: 0.0, blue: 0.0) // Black
           static let subTitle = Color(red: 0.2, green: 0.2, blue: 0.2) // Dark Gray
           static let body = Color(red: 0.3, green: 0.3, blue: 0.3) // Gray
           static let caption = Color(red: 0.4, green: 0.4, blue: 0.4) // Light Gray
           static let white = Color(red: 1.0, green: 1.0, blue: 1.0) // White
       }
}
