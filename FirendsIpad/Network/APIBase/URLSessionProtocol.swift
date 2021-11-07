//
//  URLSessionProtocol.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import Combine

protocol URLSessionProtocol {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}

extension URLSession: URLSessionProtocol {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
