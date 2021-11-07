//
//  NetworkContainerView.swift
//  FirendsIpad
//
//  Created by Islam Md. Zahirul on 6/11/21.
//

import SwiftUI

// NetworkViewModel setup into a View
protocol NetworkView: View {
    associatedtype ViewModel: NetworkViewModel
    var viewModel: ViewModel { get }
}

// common implemetation for network call view
extension NetworkView {
    func networkView<Content: View>(@ViewBuilder content: @escaping (ViewModel.NetworkResource)-> Content) -> some View {
        Group {
            // if state is loading , show loading ui
            viewModel.resource.isLoading {
                ActivityIndicatorView()
            }
            // if state succes , show content
            viewModel.resource.hasResource { data in
                content(data)
            }
            
            // if error , show error content
            viewModel.resource.hasError { error in
                Text("\(error.localizedDescription)")
            }
        }
    }
}


// common View implementation for NetworkviewModel / network call
struct NetworkContainerView<Content: View, ViewModel: NetworkViewModel>: NetworkView {
    // MARK: - Propertices
    var viewModel: ViewModel
    let content: (ViewModel.NetworkResource)-> Content
    
    // MARK:- Private Propertices
    @State var refreshFlag = false
    
    // MARK: - init
    init(viewModel: ViewModel,
         @ViewBuilder content: @escaping (ViewModel.NetworkResource) -> Content) {
        self.content = content
        self.viewModel = viewModel
    }
    
    // MARK: - UI
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





