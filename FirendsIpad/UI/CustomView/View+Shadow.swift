//
//  View+Shadow.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func card<S: Shape>(backgroundColor: Color = .white, shape: S, shadowColor: Color = Color.shadowColor, shadowRadius: CGFloat = .standardShadowRadius) -> some View {
        self.background(backgroundColor)
            .clipShape(shape)
            .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: 0)
    }
}
