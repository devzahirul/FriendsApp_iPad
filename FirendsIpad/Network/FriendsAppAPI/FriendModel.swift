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
//    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
//    let login: Login?
//    let dob, registered: Dob?
    let phone, cell: String?
//    let id: ID?
    let picture: Picture?
//    let nat: String?
    
    var fullName: String {
        return "\(name?.title ?? "") \(name?.first ?? "") \(name?.last ?? "")"
    }
    
    var address: String {
        return "\(location?.street?.number ?? 0) \(location?.street?.name ?? ""), \(location?.state ?? ""), \(location?.city ?? ""), \(location?.country ?? "")"
    }
}

// MARK: - Dob
struct Dob: Codable {
    let date: String?
    let age: Int?
}

// MARK: - ID
struct ID: Codable {
    let name: String?
    let value: String?
}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    //let postcode: Int?
   // let coordinates: Coordinates?
   // let timezone: Timezone?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String?
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
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
