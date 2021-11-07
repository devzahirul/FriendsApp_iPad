//
//  FriendDetailItemView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct FriendDetailItemView: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text("\(title): ")
            Text("\(value)")
        }.font(.fontNormal30)
        
    }
}
