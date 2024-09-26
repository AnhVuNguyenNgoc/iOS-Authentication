//
//  HomeDetailView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 20/09/2024.
//

import SwiftUI

struct HomeDetailView: View {
    
    let item: String
    
//    @Environment(\.presentationMode) var presentationMode
    
//    @Binding var selectedItem: String?
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack{
            Text(item)
                .font(.largeTitle)
            
            
            Button(action: {
                navigationManager.selectedItem = nil
                navigationManager.firstDetailIsShown = false
            }, label: {
                Text("Go back to root")
            })
            
            Button(action: {
                navigationManager.selectedItem = nil
//                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Go one step back")
            })
            
            
        } .frame(maxWidth: .infinity, maxHeight:.infinity)
            .background(Color.brown)
        
        
        
        
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView(item: "String")
    }
}
