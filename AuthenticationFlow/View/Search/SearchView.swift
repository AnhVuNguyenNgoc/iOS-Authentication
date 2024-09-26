//
//  SearchView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 20/09/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var isPresentingOverlay: Bool = false
    
    var body: some View {
        
        VStack{
            Text("Search page")
            
            Button(action: {
                isPresentingOverlay.toggle()
            }, label: {
                Text("Show overlay")
            })
            
            
            
            .fullScreenCover(isPresented: $isPresentingOverlay ,
                             content: {
                VStack{
                    Text("This is taking all the space")
                    
                    Button(action: {
                        isPresentingOverlay = false
                    }, label: {
                        Text("Done")
                    })
                }.frame(maxWidth: .infinity, maxHeight:.infinity)
                    .background(Color.brown)
                
            })
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
