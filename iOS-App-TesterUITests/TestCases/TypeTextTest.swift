//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/31/21.
//

import XCTest

class TypeTextTest: TypeTextCase {
    
    func testText() {
        
        navigateToTextType()
        waitForDisplay(for: self.idetifierStrings)
        verifyTextViewLabel()
        verifyTextView()
        self.textView.tap()
        XCTAssertTrue(self.textField.isHittable)
        
        self.textView.clear()
        Thread.sleep(forTimeInterval: 1.0)
        self.labelTypeText.doubleTap()
        let pop: XCUIElement = XCUIApplication(bundleIdentifier: "com.apple.springboard").staticTexts["Paste"]
        XCTAssertTrue(pop.waitForDisappear(timeout: 5.0))
        Thread.sleep(forTimeInterval: 1.0)
        
        dismissKeyboard()
        
        self.textField.typeText("test")
    }
}
