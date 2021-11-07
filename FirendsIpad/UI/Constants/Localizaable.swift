//
//  Localizaable.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import Foundation

enum FriendsAppString: String {
    case email = "Email"
    case name = "Name"
    case address = "Address"
    case city = "City"
    case state = "State"
    case country = "Country"
    case cellPhone = "Cell phone"
    
    case friendsListTitle = "Friends"
    case friendsDetailTitle = "Friend Detail"
    var toString: String {
        self.rawValue
    }
    
}
