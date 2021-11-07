//
//  FAViewModel.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import Combine



class FAViewModel<Response: Decodable>: NetworkViewModel {
   
    var resource: Resource<Response> = .loading
    
    var network: Network
    
    var endpoint: NetworkEndpoint
    
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(network: Network = FANetwork(), endpoint: NetworkEndpoint = FANetworkEndpoint(path: "api/", method: .get)) {
        self.network = network
        self.endpoint = endpoint
        //?page=1&results=100&seed=abc
        self.endpoint.parameters = ["page": "1", "results": "100", "seed":"abc"]
        
    }
    
    func onAppear() {
        if resource.value == nil {
            fetch(endpoint: endpoint)
        }
    }
    
    func fetch(endpoint: NetworkEndpoint) {
       defaultFetch(endpoint: endpoint)
    }
    
    typealias NetworkResource = Response
    
    
}


