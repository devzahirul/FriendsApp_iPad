//
//  AppContext.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation

protocol AppContextProtocol {
    var friendListContainer: FriendListContainer {get}
}


protocol ViewModelContainer {
    init()
}


struct FriendListContainer: ViewModelContainer{
   let friendVM = FAViewModel<FAApiListResponse<FriendModel>>()
}


struct AppContext: AppContextProtocol {
    
    var friendListContainer: FriendListContainer = FriendListContainer()
}
