//
//  AppContextKey.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import SwiftUI

struct AppContextKey: EnvironmentKey {
    static var defaultValue: AppContextProtocol = AppContext()
}

extension EnvironmentValues {
    var appContext: AppContextProtocol {
        get { self[AppContextKey.self] }
        set { self[AppContextKey.self] = newValue}
    }
}
