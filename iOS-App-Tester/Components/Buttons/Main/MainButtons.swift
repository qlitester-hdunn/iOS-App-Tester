//
//  MainButton.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/16/21.
//

import Foundation

import SwiftUI
struct MainButtons: View {
    typealias MFB = MainButtonFactory
    static let deviceScreenHeight = UIScreen.main.bounds.height
    static let numBtns = CGFloat(10)
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    HStack {
                        Text("Features Testing").frame(maxWidth: MainButtons.deviceScreenHeight * 0.30)
                        Text("    ").frame(maxWidth: MainButtons.deviceScreenHeight * 0.65, alignment: .trailing)
                    }
                }
                Group {
                    
                    VStack {
                       
//                        MFB.newButton(text: .TypeText, destination: "", action: {print("this")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
                          MFB.getButton(text: .Spinner, destiny: .spinner, action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
//                        MFB.newButton(text: .CustomList, destination: "", action: {print("that")})
                    }
                }
            }.navigationBarTitle("iOS-App-Tester", displayMode: .automatic)
        }
    }
    
}
