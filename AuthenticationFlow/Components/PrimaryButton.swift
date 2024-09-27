//
//  PrimaryButton.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 27/09/2024.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 294, height: 72)
                .foregroundColor(ColorPalette.Secondary.baseRed)
                .overlay(
                    Text(text)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                )
                .shadow(radius: 5)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "", action:  {
            print("Button was clicked!")
        })
    }
}
