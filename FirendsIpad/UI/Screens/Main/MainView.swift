//
//  MainView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
