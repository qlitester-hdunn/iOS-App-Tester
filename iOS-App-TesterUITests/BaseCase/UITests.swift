//
//  iOS_App_TesterUITests.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/16/21.
//

import XCTest

class UITests: XCTestCase {
    let app: XCUIApplication = XCUIApplication()
    static let waitTimeout: TimeInterval = 2.0
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
}

extension XCTWaiter.Result {
    
    func bool(isInverted: Bool = false, isOrdered: Bool = false) -> Bool {
        switch (self) {
        case XCTWaiter.Result.completed:
            return true
            
        case XCTWaiter.Result.timedOut:
            return false
            
        case XCTWaiter.Result.incorrectOrder:
            return (isOrdered) ? false : true
            
        case XCTWaiter.Result.invertedFulfillment:
            return (isInverted) ? false : true
            
        case XCTWaiter.Result.interrupted:
            return false
        default:
            return false
        }
    }
}

