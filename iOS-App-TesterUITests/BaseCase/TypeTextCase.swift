//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 10/19/21.
//

import Foundation
import XCTest

class TypeTextCase: UITests {
    
    let idetifierStrings = ["Hello World!"]
    var headingText: XCUIElement!
    var textView: XCUIElement!
    var labelTypeText: XCUIElement!
    
    override func setUp() {
        super.setUp()
        headingText = app.staticTexts["Type Text"].firstMatch
        textView = self.app.textViews["Hello,World"].firstMatch
        labelTypeText = self.app.staticTexts["Type Text"].firstMatch
    }
    
    static var timeout: TimeInterval = 1.0
    
    func navigateToTextType() -> Void {
        
        let condition: () -> Bool = {
            self.app.buttons["Type Text"].firstMatch.exists
        }
        
        wait(for: { self.app.buttons["Type Text"].firstMatch.exists } , description: "Wait for Type Text button", timeout: TypeTextCase.timeout)
        self.app.buttons["Type Text"].firstMatch.tap()
    }
    
    func verifyTextViewLabel(){
        XCTAssert(labelTypeText.label == "Type Text")
        
    }
    func verifyTextView(){
        XCTAssert(textView.exists)
    }
    
    func waitForDisplay(for identifiers: [String], type: XCUIElement.ElementType? = nil) -> Void {
        identifiers.forEach({
            (id) in
            print("type \(type)")
            let type = type ?? XCUIElement.ElementType.staticText
            switch (type) {
            case XCUIElement.ElementType.staticText:
                wait(for: { self.app.staticTexts[id].firstMatch.exists } )
            case XCUIElement.ElementType.textField:
                wait(for: { self.app.textFields[id].firstMatch.exists } )
            default:
                print(String(describing: "Element '\(id)' does not exist"))
            }
        })
    }
}
