//
//  LazyStack.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct LazyStack<Content: View>: View {
    let axis: Axis.Set
    let content: Content
    let useGrid: Bool
    let minimumItemSize: CGFloat
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: minimumItemSize)), count: 2)
    }
    
    init(axis: Axis.Set, useGrid:Bool = false, mininumItemSize: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.axis = axis
        self.content = content()
        self.useGrid = useGrid
        self.minimumItemSize = mininumItemSize
    }
    
    var body: some View {
        if axis == .vertical {
            if useGrid {
                LazyVGrid(columns: items, spacing: .gridItemSpacing)  {
                    content
                }
            } else {
                VStack(spacing: .zero){
                    content
                }
            }
        } else {
            if useGrid {
                LazyHGrid(rows: items, spacing: .gridItemSpacing)  {
                    content
                }
            } else {
                HStack(alignment: .firstTextBaseline, spacing: .zero) {
                    content
                }
            }
        }
    }
}
