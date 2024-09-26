//
//  CameraView.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 19/09/2024.
//


import AVFoundation
import SwiftUI

struct CameraViewController: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self, didFinishProcessingPhoto: didFinishProcessingPhoto)
    }
    
    typealias UIViewControllerType = UIViewController
    
    let cameraService: CameraService
    let didFinishProcessingPhoto: (Result<AVCapturePhoto,Error>) ->()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        cameraService.start(delegate: context.coordinator) { error in
            if let error = error {
                didFinishProcessingPhoto(.failure(error))
                return
            }
        }
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraService.previewLayer)
        cameraService.previewLayer.frame = viewController.view.bounds
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate{
        let parent: CameraViewController
        private var didFinishProcessingPhoto: (Result<AVCapturePhoto,Error>) ->()
        
        init(_ parent: CameraViewController,
             didFinishProcessingPhoto: @escaping (Result<AVCapturePhoto,Error>) ->()){
            self.parent = parent
            self.didFinishProcessingPhoto = didFinishProcessingPhoto
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            if let error = error {
                didFinishProcessingPhoto(.failure(error))
                return
            }
            
            didFinishProcessingPhoto(.success(photo))
        }
    }
}
