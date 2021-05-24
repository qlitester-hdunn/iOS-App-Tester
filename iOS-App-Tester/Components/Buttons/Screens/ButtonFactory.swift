//
//  ButtonFactory.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/23/21.
//

import Foundation
import SwiftUI

struct MainFormat {
    static let deviceScreenWidth = UIScreen.main.bounds.width
    static let deviceScreenHeight = UIScreen.main.bounds.height
    static let numBtns = CGFloat(10)
    static let fontSz = CGFloat((((deviceScreenHeight * 0.30)/MainButtonFactory.numBtns) > 21.0) ? 21.0 : 16.0)
    static let textMaxHt = CGFloat(((deviceScreenHeight * 0.35)/MainButtonFactory.numBtns) > fontSz ? fontSz * 1.2 : fontSz * 1.03)
    static let btnWidth = deviceScreenWidth * 0.80
    
    static let edges = EdgeInsets.init(
        top: textMaxHt * CGFloat(0.9),
        leading: CGFloat(btnWidth/6),
        bottom: textMaxHt * CGFloat(0.9),
        trailing: CGFloat(btnWidth/6)
    )
}

struct ButtonView: View {
    
    var text: MainButtonName
    var destiny: Destination
    var action: () -> Void
    func getDestiny(destination: Destination )-> some View {
        switch destination {
        case .spinner:
            return Spinner()
        }
    }
    var body: some View {
        let destination = getDestiny(destination: destiny)
        print("text \(text.rawValue)")
        return
            (
                NavigationLink(destination: destination){
                    RoundedRectangle(cornerRadius:25)
                        .frame(maxWidth: MainFormat.btnWidth, maxHeight: MainFormat.textMaxHt * 3)
                        .padding(MainFormat.edges)
                        .background(Color("MainBtn"))
                        .overlay(Text(text.rawValue)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .background(Color("MainBtn"))
                                    .foregroundColor(Color("BtnText"))
                                    .frame(maxWidth: MainFormat.btnWidth, maxHeight: MainFormat.textMaxHt))
                }
                .frame(maxWidth: MainFormat.btnWidth, maxHeight: MainFormat.textMaxHt * 3)
                .background(Color("MainBtn"))
                .cornerRadius(20)
            )
    }
    
}
enum Destination {
    case spinner
}
enum ButtonFactory: View  {
    case typeText
    case customList
    case spinner
    
    @ViewBuilder
    var body: some View {
        switch self {
        case .typeText:
            ButtonView(text: .TypeText, destiny: .spinner, action: {})
        case .customList:
            ButtonView(text: .CustomList, destiny: .spinner, action: {})
        case .spinner:
            ButtonView(text: .Spinner, destiny: .spinner, action: {})
        }
    }
}

