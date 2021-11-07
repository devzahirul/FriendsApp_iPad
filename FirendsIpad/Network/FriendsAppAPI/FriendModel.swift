//
//  FriendModel.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import Foundation

// MARK: - Info
struct Info: Codable {
    let seed: String?
    let results:Int?
    let page: Int?
    let version: String?
}

// MARK: - Result
struct FriendModel: Codable {
    let name: Name?
    let location: Location?
    let email: String?
    let phone, cell: String?
    let picture: Picture?

    
    var fullName: String {
        return "\(name?.title ?? "") \(name?.first ?? "") \(name?.last ?? "")"
    }
    
    var address: String {
        return "\(location?.street?.number ?? 0) \(location?.street?.name ?? ""), \(location?.state ?? ""), \(location?.city ?? ""), \(location?.country ?? "")"
    }
}



// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
}

extension FriendModel {
    static let emptyModel = FriendModel(name: Name(title: "", first: "", last: ""), location: Location(street: Street(number: -1, name: ""), city: "", state: "", country: ""), email: "", phone: "", cell: "", picture: Picture(large: "", medium: "", thumbnail: ""))
}
