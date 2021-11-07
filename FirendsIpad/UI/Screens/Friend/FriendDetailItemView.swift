//
//  FriendDetailItemView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct FriendDetailItemView: View {
    // MARK: - Propertices
    let title: String
    let value: String
    
    // MARK: - UI
    var body: some View {
        HStack {
            Text("\(title): ")
            Text("\(value)")
        }//: HStack
        .font(.fontNormal30)
    }
}
