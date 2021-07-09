//
//  Reduce.swift
//  iOS-App-Tester
//
//  Created by Tester on 7/8/21.
//

import Foundation

func reducer(state: AppState, action: Action) -> AppState {
    
    var state = state
    
    switch action {
    case .setTextEdit(let text):
        state.editText = text
    }
    
    return state
}
