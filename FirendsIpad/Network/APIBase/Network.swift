//
//  Network.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import Combine

// API errors
enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

// Network protocol for extecure a networkEndPoint
protocol Network {
    var decoder: JSONDecoder { get set }
    var environment: NetworkEnvironment { get }
    var urlSession: URLSessionProtocol { get }
}

//MARK:- Network Extention
extension Network {
    // Call for fetch data and decode it
    func fetch<T: Decodable>(endpoint: NetworkEndpoint) -> AnyPublisher<T, APIError> {
        let request = endpoint.create(for: environment)
        return urlSession
            .apiResponse(for: request)
            .tryMap { data, response in
                // Check is valid api call
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                
                // Decode data
                do {
                    return try self.decoder.decode(T.self, from: data)
                } catch {
                    // throw error
                    throw APIError.apiError(reason: error.localizedDescription)
                }
            }
            .mapError { error in
                return APIError.apiError(reason: error.localizedDescription)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

//MARK:- NetworkMethods
enum NetworkMethod: String {
    // Get method
    case get
}

// Common implementation for network protocol
struct FANetwork: Network {
    //MARK:- Propertices
    var decoder: JSONDecoder
    var environment: NetworkEnvironment
    var urlSession: URLSessionProtocol
    
    //MARK:- Init
    init(decoder: JSONDecoder = JSONDecoder(),
         environment: NetworkEnvironment = NetworkEnvironments.developNetworkEnvironment,
         urlSession: URLSessionProtocol = URLSession.shared) {
        self.decoder = decoder
        self.environment = environment
        self.urlSession = urlSession
    }
}
