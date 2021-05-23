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
        CustomListBtn.newButton(text: MainButtonName.TypeText, destination: "T", action: {})
    }
    
    static func newButton(text: MainButtonName, destination: String, action: @escaping () -> Void)  -> some View {
        let edges = EdgeInsets.init(
            top: textMaxHt * CGFloat(0.7),
            leading: CGFloat(0),
            bottom: textMaxHt * CGFloat(0.7),
            trailing: CGFloat(0)
        )
        return
            (
                
//                Button(action: {
//                    print("Delete button tapped!")
//                }) {
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: btnWidth, maxHeight: textMaxHt * 3)
                    Text("TYPE TEXT")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(edges)
                        .background(Color("MainBtn"))
                        .foregroundColor(Color.red)
                        .frame(maxWidth: .infinity, maxHeight: textMaxHt)
                }
                .frame(maxWidth: btnWidth, maxHeight: textMaxHt * 3)
                .background(Color("MainBtn"))
                .cornerRadius(20)
                
            )
    }
    
    static func newText(_ text: String) -> some View {
        let text = Text(text)
            .bold()
            .font(Font.custom("Helvetica Neue", size: fontSz))
            .padding(4)
            .foregroundColor(Color("BtnText"))
            .frame(maxWidth:.infinity, maxHeight: textMaxHt)
        
        return text
    }
}
