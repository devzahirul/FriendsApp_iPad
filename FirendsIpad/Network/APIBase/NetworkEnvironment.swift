//
//  NetworkEnvironment.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation

// networkEnvironment is used for different different developement environment like dev, stg or production
protocol NetworkEnvironment {
    var baseURLString: String { get }
}

// for dev
struct DevelopNetworkEnvironment: NetworkEnvironment {
    let baseURLString: String
}

// NameSpace for NetworkEnvironment
enum NetworkEnvironments {
    static let developNetworkEnvironment = DevelopNetworkEnvironment(baseURLString: "https://randomuser.me/")
}
