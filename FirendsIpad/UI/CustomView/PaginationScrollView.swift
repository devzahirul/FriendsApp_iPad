//
//  PaginationScrollView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 7/11/21.
//

import SwiftUI

struct PaginationScrollView<Content: View>: View {
    
    private let axis: Axis.Set
    private var content: Content
    private var useGridView: Bool
    private var minimumItemSize: CGFloat
    
    init(axis: Axis.Set = .vertical, useGridView: Bool = false, minimumItemSize: CGFloat = .gridItemminimumSize, @ViewBuilder content: @escaping() -> Content) {
        self.axis = axis
        self.content = content()
        self.useGridView = useGridView
        self.minimumItemSize = minimumItemSize
    }
    
    
    //MARK: UI
    var body: some View {
        ScrollView(axis, showsIndicators: false, content: {
            LazyStack(axis: axis, useGrid: useGridView, mininumItemSize: minimumItemSize) {
                content
            }
        })
    }
}
