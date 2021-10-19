//
//  CustomList.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/23/21.
//

import Foundation

import SwiftUI
struct CustomListBtn: View {
    static let deviceScreenWidth = UIScreen.main.bounds.width
    static let deviceScreenHeight = UIScreen.main.bounds.height
    static let numBtns = CGFloat(10)
    static let fontSz = CGFloat((((deviceScreenHeight * 0.30)/MainButtonFactory.numBtns) > 21.0) ? 21.0 : 16.0)
    static let textMaxHt = CGFloat(((deviceScreenHeight * 0.35)/MainButtonFactory.numBtns) > fontSz ? fontSz * 1.2 : fontSz * 1.03)
    static let btnWidth = deviceScreenWidth * 0.80
    
    var body: some View {
        Text("not implemented")
    }
}
