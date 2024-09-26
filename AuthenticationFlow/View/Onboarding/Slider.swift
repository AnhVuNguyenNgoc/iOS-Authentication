//
//  Slider.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import SwiftUI

struct Slider: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 30){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            Text(title).fontWeight(.bold)
            
            Text(description) .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
     
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(imageName: "", title: "", description: "")
    }
}
