//
//  ButtonFactory.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/23/21.
//

import Foundation
import SwiftUI

class MainFormat {
    static let deviceScreenWidth = UIScreen.main.bounds.width
    static let deviceScreenHeight = UIScreen.main.bounds.height
    static let numBtns = CGFloat(10)
    static let fontSz = CGFloat((((deviceScreenHeight * 0.30)/MainButtonFactory.numBtns) > 21.0) ? 21.0 : 16.0)
    static let textMaxHt = CGFloat(((deviceScreenHeight * 0.35)/MainButtonFactory.numBtns) > fontSz ? fontSz * 1.2 : fontSz * 1.03)
    static let btnWidth = deviceScreenWidth * 0.80
    static let stop: CGFloat = textMaxHt * CGFloat(0.9)
    static let sleading: CGFloat = CGFloat(btnWidth/6)
    static let sbottom: CGFloat = textMaxHt * CGFloat(0.9)
    static let strailing: CGFloat = CGFloat(btnWidth/6)
    static let textPaddingLR: CGFloat = CGFloat(btnWidth/6)
    var top: CGFloat = textMaxHt * CGFloat(0.9)
    var leading: CGFloat = CGFloat(btnWidth/6)
    var bottom: CGFloat = textMaxHt * CGFloat(0.9)
    var trailing: CGFloat = CGFloat(btnWidth/6)
    var edges: EdgeInsets = EdgeInsets.init(
        top: stop, leading: sleading, bottom: sbottom, trailing: strailing
    )
    
    init(top: CGFloat = stop, leading: CGFloat = sleading, bottom: CGFloat = sbottom, trailing: CGFloat = strailing){
        self.edges = EdgeInsets.init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
}

struct ButtonView: View {
    
    var text: MainButtonName
    var destiny: Destination
    var action: () -> Void
    
    @ViewBuilder
    func getDestiny(destination: Destination) -> some View {

        switch destination {
        case .spinner:
            Spinner(title: "Countries")
        case .customList:
            CustomList()
        case .typeText:
            TypeText()
        }
    }
    
    var body: some View {
        let destination = getDestiny(destination: destiny)
        print("text \(text.rawValue) length \(text.rawValue.count)")
        let denom = (6 * (CGFloat(text.rawValue.count)/19))
        let textPaddingLR = (text.rawValue.count < 16) ?
            max(MainFormat.btnWidth/6, MainFormat.btnWidth/denom) : MainFormat.textPaddingLR
        
        return
            (
                NavigationLink(destination: destination){
                    RoundedRectangle(cornerRadius:25)
                        .frame(maxWidth: MainFormat.btnWidth, maxHeight: MainFormat.textMaxHt * 3)
                        .padding(
                            MainFormat(
                                top: MainFormat.stop,
                                leading: textPaddingLR,
                                bottom: MainFormat.sbottom,
                                trailing: textPaddingLR
                            ).edges
                        )
                        .background(Color("MainBtn"))
                        .overlay(Text(text.rawValue)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .background(Color("MainBtn"))
                                    .foregroundColor(Color("BtnText"))
                                    .frame(maxWidth: MainFormat.btnWidth, maxHeight: MainFormat.textMaxHt))
                }
                .frame(maxWidth: MainFormat.btnWidth, maxHeight: MainFormat.textMaxHt * 3)
                .background(Color("BtnText"))
                .cornerRadius(20)
            )
    }
    
}
enum Destination {
    case spinner
    case customList
    case typeText
}
enum ButtonFactory: View  {
    case typeText
    case customList
    case spinner
    
    var body: some View {
        switch self {
        case .typeText:
            return ButtonView(text: .TypeText, destiny: .typeText, action: {})
        case .customList:
            return ButtonView(text: .CustomList, destiny: .customList, action: {})
        case .spinner:
           return  ButtonView(text: .Spinner, destiny: .spinner, action: {})
        }
    }
}

