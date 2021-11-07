//
//  FirendDetailView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI


struct FirendDetailView: View {
    let friend: FriendModel
    
    var body: some View {
        VStack {
            List {
                NetworkImageView(imageDownloader: DefaultImageDownloader.get(for: friend.picture?.large))
                    .frame(width: .circleImageWidth, height: .circleImageWidth)
                    .scaledToFit()
                    .clipShape(Circle())
                FriendDetailItemView(title: FriendsAppString.name.toString, value: friend.fullName)
                
                FriendDetailItemView(title: FriendsAppString.address.toString, value: friend.address)
                FriendDetailItemView(title: FriendsAppString.city.toString, value: friend.location?.city ?? "")
                FriendDetailItemView(title: FriendsAppString.state.toString, value: friend.location?.state ?? "")
                FriendDetailItemView(title: FriendsAppString.country.toString, value: friend.location?.country ?? "")
                
                HStack {
                    Text("\(FriendsAppString.email.toString): ")
                    Link("\(friend.email ?? "")", destination: URL(string: "mailto:\(friend.email ?? "")")!)
                        .foregroundColor(.mailTinColor)
                }.font(.system(size: 30))
                
                FriendDetailItemView(title: FriendsAppString.cellPhone.toString, value: friend.cell ?? "")
            }
            
            .navigationTitle(Text(FriendsAppString.friendsDetailTitle.toString))
        }
    }
}

