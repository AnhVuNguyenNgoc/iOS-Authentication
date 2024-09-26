//
//  ScanFood.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 19/09/2024.
//

import SwiftUI
import AVFoundation
//
//struct CameraView: UIViewControllerRepresentable {
//    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
//        var parent: CameraView
//        var photoOutput: AVCapturePhotoOutput?
//
//        init(parent: CameraView) {
//            self.parent = parent
//        }
//
//        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//            guard let data = photo.fileDataRepresentation(),
//                  let image = UIImage(data: data) else { return }
//            print("Photo captured successfully.")
//            parent.imageModel.saveImage(image)
//        }
//
//        func capturePhoto() {
//              let settings = AVCapturePhotoSettings()
//            photoOutput?.capturePhoto(with: settings, delegate: self)
//        }
//
//    }
//
//    @ObservedObject var imageModel: ImageModel
//
//    func makeCoordinator() -> Coordinator {
//        print("Creating Coordinator.")
//        return Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        print("Creating UIViewController.")
//
//        let viewController = UIViewController()
//        let captureSession = AVCaptureSession()
//        guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
//            print("No video capture device available.")
//            return viewController }
//        let videoInput: AVCaptureDeviceInput
//
//        do {
//            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
//        } catch {
//            print("Error creating video input: \(error.localizedDescription)")
//            return viewController
//        }
//
//        if (captureSession.canAddInput(videoInput )) {
//            print("Video input added to capture session.")
//            captureSession.addInput(videoInput)
//        } else {
//            print("Could not add video input to capture session.")
//            return viewController
//        }
//
//        let photoOutput = AVCapturePhotoOutput()
//        if captureSession.canAddOutput(photoOutput) {
//            print("Photo output added to capture session.")
//            captureSession.addOutput(photoOutput)
//        }else {
//            print("Could not add photo output to capture session.")
//        }
//
//        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        videoPreviewLayer.frame = viewController.view.layer.bounds
//        videoPreviewLayer.videoGravity = .resizeAspectFill
//        viewController.view.layer.addSublayer(videoPreviewLayer)
//
//        captureSession.startRunning()
//
//        print("Capture session started.")
//
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        print("Updating UIViewController.")
//    }
//}
//
//struct ScanOverlay: View {
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .stroke(style: StrokeStyle(lineWidth: 4, dash: [10]))
//                .foregroundColor(.black)
//                .frame(width: 200, height: 200)
//        }
//    }
//}
//
//struct ScanFood: View {
//    @StateObject private var imageModel = ImageModel()
//    @State private var cameraViewCoordinator: CameraView.Coordinator?
//
//       var body: some View {
//           ZStack {
//               CameraView(imageModel: imageModel)
//                   .edgesIgnoringSafeArea(.all)
//
//               ScanOverlay()
//               VStack {
//                   Spacer()
//                   HStack {
//                       Spacer()
//                       Button(action: {
//                           // Capture action
//                           cameraViewCoordinator?.capturePhoto()
//                       }) {
//                           Image(systemName: "camera.circle.fill")
//                               .resizable()
//                               .frame(width: 70, height: 70)
//                               .foregroundColor(.pink)
//                       }
//                       Spacer()
//                   }
//                   .padding(.bottom, 50)
//               }
//           }
//           .onAppear {
//               // Initialize the coordinator and store it
//               let cameraView = CameraView(imageModel: imageModel)
//               cameraViewCoordinator = cameraView.makeCoordinator()
//           }
//       }
//}
//
//struct ScanFood_Previews: PreviewProvider {
//    static var previews: some View {
//        ScanFood()
//    }
//}
