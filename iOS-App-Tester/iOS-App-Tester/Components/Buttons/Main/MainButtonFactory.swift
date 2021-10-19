//
//  MainButtonFactory.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/17/21.
//

import Foundation
import SwiftUI

class MainButtonFactory {
    static let deviceScreenWidth = UIScreen.main.bounds.width
    static let deviceScreenHeight = UIScreen.main.bounds.height
    static let numBtns = CGFloat(10)
    static let fontSz = CGFloat((((deviceScreenHeight * 0.30)/MainButtonFactory.numBtns) > 21.0) ? 21.0 : 16.0)
    static let textMaxHt = CGFloat(((deviceScreenHeight * 0.35)/MainButtonFactory.numBtns) > fontSz ? fontSz * 1.2 : fontSz * 1.03)
    static let btnWidth = deviceScreenWidth * 0.80
    //static func newButton(text: MainButtonName, destination: Destination, action: @escaping () -> Void) -> some View {
    static func getButton(text: MainButtonName, destiny: Destination, action: @escaping () -> Void) -> some View {
        return ButtonView(text: text, destiny: destiny, action:{})
    }
        
    static let edges = EdgeInsets.init(
        top: textMaxHt * CGFloat(0.7),
        leading: CGFloat(btnWidth/10),
        bottom: textMaxHt * CGFloat(0.7),
        trailing: CGFloat(btnWidth/10)
    )
        
    
//        return
//            (
//                NavigationLink(destination: getDestination(text: text, destiny: destination, action: action )){
//                    RoundedRectangle(cornerRadius:25)
//                        .frame(maxWidth: btnWidth, maxHeight: textMaxHt * 3)
//                        .padding(edges)
//                        .background(Color("MainBtn"))
//                        .overlay(Text(text.rawValue)
//                        .fontWeight(.bold)
//                        .font(.title)
//                        .background(Color("MainBtn"))
//                        .foregroundColor(Color.red)
//                        .frame(maxWidth: btnWidth, maxHeight: textMaxHt))
//                }
//                .frame(maxWidth: btnWidth, maxHeight: textMaxHt * 3)
//                .background(Color("MainBtn"))
//                .cornerRadius(20)
//            )
//    }

}
