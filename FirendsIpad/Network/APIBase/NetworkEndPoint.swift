//
//  NetworkEndPoint.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import Foundation

/**
 Defines an API call. Everything needed to create a URLRequest.
 */
protocol NetworkEndpoint {
    var path: String { get }
    var method: NetworkMethod { get }
    var parameters: [String: String]? { set get }
}

extension NetworkEndpoint {

    var headers: [String : String]? {
        return nil
    }

    var parameters: [String : String]? {
        return nil
    }

    func create(for environment: NetworkEnvironment) -> URLRequest {
        let url = URL(string: environment.baseURLString + path)!

        var components = URLComponents()
        components.scheme = url.scheme
        components.host = url.host
        components.path = url.path

        if let parameters = parameters, method == .get {
            components.queryItems = URLQueryItem.items(dictionary: parameters)
        }
       
        var request = URLRequest(url: components.url!)
       
        request.httpMethod = method.rawValue.uppercased()

        return request
    }
}

extension URLQueryItem {
    static func items(dictionary: [String: String]) -> [URLQueryItem] {
        return dictionary.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
    }
}

// common implementation for NetworkEndpoint
struct FANetworkEndpoint: NetworkEndpoint {
    var parameters: [String : String]?
    
    var path: String
    
    var method: NetworkMethod
}
