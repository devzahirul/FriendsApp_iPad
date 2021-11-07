//
//  NetworkViewModel.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import Combine

protocol NetworkViewModel: ObservableObject {
    associatedtype NetworkResource: Decodable
    
    var objectWillChange: ObservableObjectPublisher { get }
    var resource: Resource<NetworkResource> { get set }
    var network: Network { get }
    var endpoint: NetworkEndpoint { get }
    var bag: Set<AnyCancellable> { get set }
    
    func onAppear()
    func fetch(endpoint: NetworkEndpoint)
}

extension NetworkViewModel {

    func defaultFetch(endpoint: NetworkEndpoint) {

        (network.fetch(endpoint: endpoint) as AnyPublisher<NetworkResource, APIError>)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.resource = .error(error)
                    self.objectWillChange.send()
                default:
                    break
                }
            }, receiveValue: { decodable in
                self.resource = .success(decodable)
                self.objectWillChange.send()
            })
            .store(in: &bag)
    }
}






