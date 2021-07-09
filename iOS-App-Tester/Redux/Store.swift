//
//  Store.swift
//  iOS-App-Tester
//
//  Created by Tester on 7/8/21.
//

import Foundation

final class Store: ObservableObject {
    
    @Published private(set) var state: AppState
    
    init(state: AppState = .init(editText: "Hello,World")) {
        self.state = state
    }
    
    public func dispatch(action: Action) {
        state = reducer(state: state, action: action)
    }
    
    func dispatchAsyn(action: Action) {
        DispatchQueue.main.async {
            self.state = reducer(state: self.state, action: action)
        }
    }
}
