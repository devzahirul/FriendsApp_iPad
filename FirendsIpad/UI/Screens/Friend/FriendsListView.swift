//
//  FriendsListView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.appContext) var context
    
    @State var moveToDetail = false
    @State var selectedFriendModel: FriendModel?
    
    private var container: FriendListContainer {
        context.friendListContainer
    }
    
    var body: some View {
        NetworkContainerView(viewModel: container.friendVM) { response in
            PaginationScrollView(useGridView: true) {
                ForEach(response.results ?? [], id: \.cell) { element in
                    FriendItemCardView(frinedModel: element)
                        .card(shape: Rectangle())
                    .onTapGesture {
                        selectedFriendModel = element
                        moveToDetail = true
                    }
                    
                    
                  }
                 
                }
            .navigationTitle(Text(FriendsAppString.friendsListTitle.toString))
            
            NavigationLink(destination: FirendDetailView(friend: selectedFriendModel ?? FriendModel.emptyModel), isActive: $moveToDetail) {
                EmptyView()
            }
        }
    }
}

