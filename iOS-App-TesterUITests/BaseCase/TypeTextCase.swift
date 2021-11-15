//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 10/19/21.
//

import Foundation
import XCTest

class TypeTextCase: UITests {
//    let landingPage = LandingPageScreen()
    let identifierStrings = ["Hello,World"]
    var headingText: XCUIElement!
    var textView: XCUIElement!
    var textField: XCUIElement!
    var labelTypeText: XCUIElement!
    var backArrowButton: XCUIElement!
    
    override func setUp() {
        super.setUp()
        
        backArrowButton = self.app.images["arrow.left"]
        headingText = self.app.staticTexts["Type Text"].firstMatch
        textView = self.app.textViews["Hello,World"].firstMatch
        textField = self.app.textViews["typeTextField"]
        labelTypeText = self.app.staticTexts["Type Text"].firstMatch
    }
    
    static var timeout: TimeInterval = 1.0
    
//    func navigateToTextType() -> Void {
//        
//        let condition: () -> Bool = {
//            self.app.buttons["Type Text"].firstMatch.exists
//        }
//        
//        wait(for: condition , description: "Wait for Type Text button", timeout: TypeTextCase.timeout)
//        self.app.buttons["Type Text"].firstMatch.tap()
//    }
    
//    func tapBackButton(){
//        backArrowButton.tap()
//    }
//    
//    func tapTypeTextLable(){
//        labelTypeText.tap()
//    }
//    func tapTextFieldView(){
//        self.textField.tap()
//    }
    
    
    
    func verifyTextViewLabel(){
        XCTAssert(labelTypeText.label == "Type Text")
        
    }
    func verifyTextField(){
        XCTAssertTrue(textField.exists)
    }
    func verifyTextView(){
        XCTAssertTrue(textView.exists)
    }
    
    
    
}
