//
//  CacheManageProtocol.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import Foundation
import UIKit

// cache for store already loaded images
protocol ImageCacheManageProtocol {
    func add(data: UIImage?, for key: String)
    func data(for key: String) -> UIImage?
}

// dectionary implementation for CacheManager
class InMemoryCacheManager: ImageCacheManageProtocol {
    static let shared = InMemoryCacheManager()
    var cache = [String: UIImage?]()
    
    func add(data: UIImage?, for key: String) {
        cache[key] = data
    }
    
    func data(for key: String) -> UIImage? {
        return cache[key] as? UIImage
    }
}
