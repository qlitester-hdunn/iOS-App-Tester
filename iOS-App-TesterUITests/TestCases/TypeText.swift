//
//  TypeText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/31/21.
//

import XCTest

//extension XCTWaiter.Result {
//
//    func bool(isInverted: Bool = false, isOrdered: Bool = false) -> Bool {
//        switch (self) {
//        case XCTWaiter.Result.completed:
//            return true
//
//        case XCTWaiter.Result.timedOut:
//            return false
//
//        case XCTWaiter.Result.incorrectOrder:
//            return (isOrdered) ? false : true
//
//        case XCTWaiter.Result.invertedFulfillment:
//            return (isInverted) ? false : true
//
//        case XCTWaiter.Result.interrupted:
//            return false
//        default:
//            return false
//        }
//    }
//}

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
