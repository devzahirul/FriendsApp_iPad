//
//  ImageDownloaderProtocol.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import Foundation
import Combine
import UIKit


protocol ImageDownloaderProtocol {
    var imageData: UIImage? { set get }
    var url: URL? { get }
    var urlSessionProtocol: URLSessionProtocol { get }
    
}

extension ImageDownloaderProtocol {
    func load()-> AnyPublisher<Data?, Error> {
        urlSessionProtocol.apiResponse(for: URLRequest(url: url!))
            .tryMap { response in
                response.data
            }.receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


class DefaultImageDownloader: ImageDownloaderProtocol, ObservableObject {
    var imageData: UIImage?
    var url: URL?
    var urlSessionProtocol: URLSessionProtocol
    var cacheManageProtocol: ImageCacheManageProtocol
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(urlSessionProtocol: URLSessionProtocol = URLSession.shared, url: URL?, cacheManageProtocol: ImageCacheManageProtocol = InMemoryCacheManager.shared) {
        self.urlSessionProtocol = urlSessionProtocol
        self.url = url
        self.cacheManageProtocol = cacheManageProtocol
    }
    
    func fetch() {
        if let data = cacheManageProtocol.data(for: url?.absoluteString ?? "") {
            imageData = data
            objectWillChange.send()
        } else {
            load()
                .sink { completion in
                    //TODO: handle completion & error
                } receiveValue: {[weak self] data in
                    if let data = data {
                        self?.imageData = UIImage(data: data)
                        self?.cacheManageProtocol.add(data: self?.imageData!, for: self?.url?.absoluteString ?? "")
                        self?.objectWillChange.send()
                    }
                }.store(in: &bag)
          
        }
        
    }
}

extension DefaultImageDownloader {
    static func get(for url: String?) -> DefaultImageDownloader {
        DefaultImageDownloader(url: URL(string: url!))
    }
}
