//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/31/21.
//

import XCTest

class TypeText: TypeTextCase {
    
    func testText() {
        navigateToTextType()
        waitForDisplay(for: self.idetifierStrings, type: XCUIElement.ElementType.textView)
        verifyTextViewLabel()
        verifyTextView()
    }
}
