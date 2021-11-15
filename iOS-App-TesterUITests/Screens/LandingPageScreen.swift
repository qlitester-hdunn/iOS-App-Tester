//
//  LandingPageCase.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 11/15/21.
//

import Foundation
import XCTest

class LandingPageScreen: BaseScreen {
    
    var typeTextButton: XCUIElement { self.app.buttons["Type Text"].firstMatch }
    
    let identifierStrings = ["Features Testing", "Type Text"]
    
    
    func navigateToTypeText(){
        waitForDisplay(for: self.identifierStrings)
        self.typeTextButton.tap()
    }
    
    func verifyScreen (){
        self.waitForDisplay(for: self.identifierStrings)
    }
}
