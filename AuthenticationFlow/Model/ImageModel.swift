//
//  Image.swift
//  AuthenticationFlow
//
//  Created by Vu Nguyen Ngoc Anh on 19/09/2024.
//

import Foundation
import SwiftUI

class ImageModel: ObservableObject {
    @Published var capturedImage: UIImage?
    
    func saveImage(_ image: UIImage) {
        // Logic to save or process the image
        capturedImage = image
    }
}
