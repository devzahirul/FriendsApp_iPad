//
//  NetworkViewModel.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import Combine

// NetworkViewModel is base protocol for API call and response handler
// NetworkviewModel is also a container of API response
// resource is store for NetworkResponse states : isLoading/ success with data/  error
// OnAppear is startPoint and maintain logic for different different ViewModel case
// Execute step is very simple , it takes network protocol, network endpoint & call fetch for endpoint and store & handle data
// ObservableObject used for notifiy view when state changes (loading, success, error)
// objectWillChange.send() has used for manually notify on demand , this is good for controll it by code & best practice as well
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

// MARK:- NetworkViewModel
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






