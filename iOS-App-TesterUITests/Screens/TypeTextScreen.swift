//
//  TypeTextScreen.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 11/15/21.
//

import Foundation
import XCTest

class TypeTextScreen: BaseScreen {
    
    let identifierStrings = ["Hello,World"]
    var headingText: XCUIElement!
    var textView: XCUIElement!
    var textField: XCUIElement!
    var labelTypeText: XCUIElement!
    var backArrowButton: XCUIElement!
    
    override init () {
        super.init()
        backArrowButton = self.app.images["arrow.left"]
        headingText = self.app.staticTexts["Type Text"].firstMatch
        textView = self.app.textViews["Hello,World"].firstMatch
        textField = self.app.textViews["typeTextField"]
        labelTypeText = self.app.staticTexts["Type Text"].firstMatch
    }
    
    func tapBackButton(){
        backArrowButton.tap()
    }
    
    func tapTypeTextLable(){
        labelTypeText.tap()
    }
    func tapTextFieldView(){
        self.textField.tap()
    }
    
    func verifyTextViewLabel(){
        XCTAssert(labelTypeText.label == "Type Text")
        
    }
    func verifyTextField(){
        XCTAssertTrue(textField.exists)
    }
    func verifyTextView(){
        XCTAssertTrue(textView.exists)
    }
    
    func type(text: String){
        guard (self.textField as XCUIElement?) != nil else {
            XCTFail("Failed to Find TextView")
            return
        }
        app/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        text.forEach { (char) in
            self.app.keys["\(char)"].tap()
        }
        Thread.sleep(forTimeInterval: 0.5)
        dismissKeyboard()
        
    }
    
    func dismissKeyboard(){
        tapTypeTextLable()
        tapBackButton()
        Thread.sleep(forTimeInterval: 0.50)
    }
    
    func dismissClipPop(){
        dismissKeyboard()
        tapTextFieldView()
    }
    
    func verifyScreen (){
        self.waitForDisplay(for: self.identifierStrings)
    }
}
