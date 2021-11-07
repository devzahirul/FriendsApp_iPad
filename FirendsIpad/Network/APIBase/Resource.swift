//
//  Resource.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import Foundation
import SwiftUI

// resource used for network response and network state handler
enum Resource<T> {
    //when start api call
    case loading
    // when return success
    case success(T)
    // when get error
    case error(Error)
}


extension Resource {
    var loading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }
    
    var error: Error? {
        switch self {
        case .error(let error):
            return error
        
        default:
        return nil
        }
    }
    
    var value: T? {
        switch self {
        case .success(let value):
        return value
        default:
        return nil
        }
    }
}

// make UI for different network states (error, success & loading)
extension Resource {
    func isLoading<Content: View>(@ViewBuilder content: @escaping ()-> Content) -> Content? {
        // if current state is loading return loading ui content (View)
        if loading {
            return content()
        }
        return nil
    }

    func hasResource<Content: View>(@ViewBuilder content: @escaping (T) -> Content) -> Content? {
        // if current state is success , then return content (View) with response data
        if let value = value {
            return content(value)
        }
        return nil
    }
    
    func hasError<Content: View>(@ViewBuilder content: @escaping (Error)-> Content ) -> Content? {
        // if current state is error, return error view
        if let error = error {
            return content(error)
        }
        return nil
    }
}
