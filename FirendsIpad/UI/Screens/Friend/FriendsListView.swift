//
//  FriendsListView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct HomeView: View {
    //MARK:- Environment
    @Environment(\.appContext) var context
    
    // MARK: - State propertices
    @State var moveToDetail = false
    @State var selectedFriendModel: FriendModel?
    
    // MARK: - Private propertices
    private var container: FriendListContainer {
        context.friendListContainer
    }
    
    // MARK: - UI
    var body: some View {
        NetworkContainerView(viewModel: container.friendVM) { response in
            PaginationScrollView(useGridView: true) {
                ForEach(response.results ?? [], id: \.cell) { element in
                    FriendItemCardView(frinedModel: element)
                        .card(shape: Rectangle())
                    .onTapGesture {
                        selectedFriendModel = element
                        moveToDetail = true
                    }//: onTap
                    
                  }//: ForEacj
                 
                }//: paginationScrollView
            .navigationTitle(Text(FriendsAppString.friendsListTitle.toString))
            
            // Router
            NavigationLink(destination: FriendDetailView(friend: selectedFriendModel ?? FriendModel.emptyModel), isActive: $moveToDetail) {
                EmptyView()
            }//: navigationLink
        }
    }
}

