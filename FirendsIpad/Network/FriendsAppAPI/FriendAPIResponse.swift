//
//  FriendAPIResponse.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import Foundation

struct FAApiListResponse<Data: Decodable>: Decodable {
    let results: [Data]?
    let info: Info?
}

typealias FriendAPIResponse = FAApiListResponse<FriendModel>
