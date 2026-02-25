//
//  ImagePicker.swift
//  HealPoint
//
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        PhotosPicker(
            selection: Binding(
                get: { nil },
                set: { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImage = uiImage
                        }
                    }
                }
            ),
            matching: .images
        ) {
            Text("Select Image")
        }
    }
}
