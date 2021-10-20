//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/31/21.
//

import XCTest

class TypeText: TypeTextCase {

    func testExample() {
        verifyButtonCount()
        navigateToTextType()
        verifyHeadingText()
        verifyTextViewLabel()
        verifyTextViewExists()
        verifyKeyboardAppears()
        verifyBackButton()
        tapBackButton()
        naviateToCustomListAdapter()
        verifyCanScrollDown()
        naviateToTop()
    }
}
