//
//  FirendItemCardView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct FriendItemCardView: View {
    let frinedModel: FriendModel
    var body: some View {
        VStack(alignment: .leading) {
            NetworkImageView(imageDownloader: DefaultImageDownloader.get(for: frinedModel.picture?.thumbnail ?? ""))
                .scaledToFit()
                .clipShape(Circle())
            Text("\(frinedModel.fullName)")
                .lineLimit(1)
            Text("\(frinedModel.location?.country ?? "")")
                .foregroundColor(.subTitleColor)
        }//: VStack
        
    }
}
