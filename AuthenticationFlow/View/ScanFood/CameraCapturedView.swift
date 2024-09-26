//
//  CameraOutputView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 19/09/2024.
//

import SwiftUI

struct CameraCapturedView: View {
    @Binding var captureImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool
    
    var body: some View {
        ZStack {
            if captureImage != nil {
                Image(uiImage: captureImage!)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            } else {
                Color(UIColor.systemBackground)
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    isCustomCameraViewPresented.toggle()
                }, label: {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 56))
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraView(captureImage: $captureImage)
                })
            }
        }
    }
}
