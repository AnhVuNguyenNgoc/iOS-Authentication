//
//  HomeDetailView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 20/09/2024.
//

import SwiftUI

struct HomeDetailListView: View {
    
    let items:[String] = ["A","b","C"]
    
//    @State private var selectedItem: String? = nil
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        
        List(items, id: \.self){
            item in
            
            NavigationLink(item, destination: HomeDetailView(item: item), tag: item, selection: $navigationManager.selectedItem)
            
//            NavigationLink(destination: HomeDetailView(item: item), label: {
//                Text(item)
//            })
        }.navigationTitle("Home Detail View")
        
    }
}

struct HomeDetailListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailListView().environmentObject(NavigationManager())
    }
}
