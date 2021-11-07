//
//  NetworkImageView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

// Network image view for load image from a url
struct NetworkImageView: View {
    
    // MARK: - Propertices
    var imageDownloader: DefaultImageDownloader
    
    // MARK: - State Propertices
    @State var uiImage: UIImage? = nil
    
    // MARK: - UI
    var body: some View {
        VStack {
            if uiImage != nil {
                Image(uiImage: uiImage!)
                    .resizable()
            } else {
                ActivityIndicatorView()
            }
        }.onAppear(perform: {
            if uiImage == nil {
                imageDownloader.fetch()
            }
        })
        .onReceive(imageDownloader.objectWillChange, perform: { _ in
            uiImage = imageDownloader.imageData!
        })
    }
}
