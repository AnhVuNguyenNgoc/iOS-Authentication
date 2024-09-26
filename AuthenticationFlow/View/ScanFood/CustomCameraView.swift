//
//  CustomCameraView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 19/09/2024.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var captureImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View{
        ZStack{
            CameraViewController(cameraService: cameraService) { result in
                switch result {
                    
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        captureImage = UIImage(data: data)
                    }else{
                        print("Error")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            
            VStack{
                Spacer()
                
                Button(action: {
                    cameraService.capturePhoto()
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 56))
                        .foregroundColor(.white)
                })
                .padding(.bottom)
            }
        }
    }
}
