//
//  MainButton.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/16/21.
//

import Foundation

import SwiftUI
struct MainButtons: View {
    typealias mfb = MainButtonFactory
    static let deviceScreenHeight = UIScreen.main.bounds.height
    static let numBtns = CGFloat(10)
    var body: some View {
        NavigationView {
            VStack{
                Text("Features Testing")
                
                VStack(alignment: .center, spacing: (MainButtons.deviceScreenHeight * 0.05)/MainButtons.numBtns) {
                    
                    NavigationLink(destination: TypeText()){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(maxWidth: .infinity, minHeight: 25)
                                .background(Color("MainBtn"))
                            
                            Text(MainButtonName.TypeText.rawValue)
                                .bold()
                                .font(Font.custom("Helvetica Neue", size: 16))
                                .padding(4)
                                .foregroundColor(Color("BtnText"))
                                .frame(maxWidth: .infinity, maxHeight: 16)//mfb.newButton(text: .TypeText, action: {print("this")} )
                        }.navigationTitle("Navigation")
                    }
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                    mfb.newButton(text: .CustomList, action: {print("that")})
                }
            }//.navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}
