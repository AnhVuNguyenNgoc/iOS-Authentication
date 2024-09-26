//
//  ContentView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 13/09/2024.
//

import SwiftUI

struct CameraCustomView: View {
    @State private var captureImage: UIImage? = nil
    @State private var isCusomCameraViewPresented = false
    
    
    var body: some View {
        ZStack{
            
            
            if captureImage != nil {
                Image(uiImage: captureImage!)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }else{
                Color(UIColor.systemBackground)
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    isCusomCameraViewPresented.toggle()
                }, label: {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 56))
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .padding(.bottom)
                .sheet(isPresented: $isCusomCameraViewPresented, content: {
                    CustomCameraView(captureImage: $captureImage)
                })
            }
        }
        
    }
}

struct CameraCustomView_Previews: PreviewProvider {
    static var previews: some View {
        CameraCustomView()
    }
}
