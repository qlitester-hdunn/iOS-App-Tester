//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/31/21.
//

import XCTest

class TypeTextTest: TypeTextCase {
    
    func testText() {
        let landingPage = LandingPageScreen()
        landingPage.verifyScreen()
        landingPage.navigateToTypeText()
        verifyTextViewLabel()
        verifyTextView()
        self.textView.tap()
        XCTAssertTrue(self.textField.isHittable)
        
        self.textView.clear()
        Thread.sleep(forTimeInterval: 1.0)
        self.textField.tap()
//        self.tapTypeTextLable()
////        let pop: XCUIElement = XCUIApplication(bundleIdentifier: "com.apple.springboard").staticTexts["Paste"]
////        XCTAssertTrue(pop.waitForDisappear(timeout: 1.0))
//        Thread.sleep(forTimeInterval: 1.0)
//
//        type(text: "test")
//        XCTAssert("test" == self.textField.value! as! String)
    }
}
