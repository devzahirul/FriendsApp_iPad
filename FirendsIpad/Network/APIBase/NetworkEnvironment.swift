//
//  NetworkEnvironment.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation

protocol NetworkEnvironment {
    var baseURLString: String { get }
}


struct DevelopNetworkEnvironment: NetworkEnvironment {
    let baseURLString: String
}

struct StagingNetworkEnvironment: NetworkEnvironment {
    let baseURLString: String
}

struct ProductionNetworkEnvironment: NetworkEnvironment {
    let baseURLString: String
}

//enum NetworkEnvironment: String {
//    case development
//
//    var baseURLString: String {
//        switch self {
//        case .development: return "https://randomuser.me/"
//        }
//    }
//}

enum NetworkEnvironments {
    static let developNetworkEnvironment = DevelopNetworkEnvironment(baseURLString: "https://randomuser.me/")
    static let stgNetworkEnvironment = DevelopNetworkEnvironment(baseURLString: "https://randomuser.me/")
    static let productionNetworkEnvironment = DevelopNetworkEnvironment(baseURLString: "https://randomuser.me/")
}
