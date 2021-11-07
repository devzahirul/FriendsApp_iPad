//
//  Network.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import Combine

protocol Network {
    var decoder: JSONDecoder { get set }
    var environment: NetworkEnvironment { get }
    var urlSession: URLSessionProtocol { get }
}

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

extension Network {
    func fetch<T: Decodable>(endpoint: NetworkEndpoint) -> AnyPublisher<T, APIError> {

        let request = endpoint.create(for: environment)
        return urlSession
            .apiResponse(for: request)
            .tryMap { data, response in
               
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                do {
                    print( String(data: data, encoding: .utf8) ?? "")
                    return try self.decoder.decode(T.self, from: data)
                } catch {
                   
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

enum NetworkMethod: String {
    case get
}



struct FANetwork: Network {
    var decoder: JSONDecoder
    
    var environment: NetworkEnvironment
    
    var urlSession: URLSessionProtocol
    
    init(decoder: JSONDecoder = JSONDecoder(),
         environment: NetworkEnvironment = NetworkEnvironments.developNetworkEnvironment,
         urlSession: URLSessionProtocol = URLSession.shared) {
        self.decoder = decoder
        self.environment = environment
        self.urlSession = urlSession
    }
}
