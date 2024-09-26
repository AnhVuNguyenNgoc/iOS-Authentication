//
//  OnboardingView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 26/09/2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            
            TabView(selection: $currentPage){
                
                Slider(imageName: "Illustrations-1", title: "Eat Healthy", description: "Maintaining good health should be the primary focus of everyone.")
                    .tag(0)
                
                Slider(imageName: "Illustrations-2", title: "Healthy Recipes", description: "Browse thousands of healthy recipes from all over the world.")
                    .tag(1)
                
                Slider(imageName: "Illustrations-3", title: "Track Your Health", description: "With amazing inbuilt tools you can track your progress.")
                    .tag(2)
                
            }
            .frame(height: 400)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            CustomPageIndicator(numberOfPages: 3, currentPage: $currentPage)
                .padding(.bottom, 20)
        }
        
    }
}

struct CustomPageIndicator: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        currentPage = index
                    }
                }) {
                    Circle()
                        .fill(index == currentPage ? ColorPalette.Secondary.baseRed : ColorPalette.Secondary.lightRed250)
                        .frame(width: 10, height: 10)
                }
                .buttonStyle(PlainButtonStyle()) // Removes button styling
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
