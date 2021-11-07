//
//  NetworkContainerView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import SwiftUI

protocol NetworkView: View {
    associatedtype ViewModel: NetworkViewModel
    var viewModel: ViewModel { get }
}

extension NetworkView {
    func networkView<Content: View>(@ViewBuilder content: @escaping (ViewModel.NetworkResource)-> Content) -> some View {
        Group {
            viewModel.resource.isLoading {
                ActivityIndicatorView()
            }
            
            viewModel.resource.hasResource { data in
                content(data)
            }
            
            viewModel.resource.hasError { error in
                Text("\(error.localizedDescription)")
            }
        }
    }
}


struct NetworkContainerView<Content: View, ViewModel: NetworkViewModel>: NetworkView {
    var viewModel: ViewModel
    let content: (ViewModel.NetworkResource)-> Content
    
    @State var refreshFlag = false
    
    init(viewModel: ViewModel,
         @ViewBuilder content: @escaping (ViewModel.NetworkResource) -> Content) {
        self.content = content
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            networkView { response in
                content(response)
            }
            if refreshFlag {EmptyView()} else {EmptyView()}
        }.onAppear(perform: {
            viewModel.onAppear()
        })
        .onReceive(viewModel.objectWillChange, perform: { _ in
            refreshFlag.toggle()
        })
    }
}





