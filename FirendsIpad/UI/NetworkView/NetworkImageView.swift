//
//  NetworkImageView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct NetworkImageView: View {
   
    var imageDownloader: DefaultImageDownloader
    @State var uiImage: UIImage? = nil
    
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
