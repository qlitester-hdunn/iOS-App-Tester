//
//  iOS_App_TesterUITests.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 5/16/21.
//

import XCTest

class UITests: XCTestCase {
    let app: XCUIApplication = XCUIApplication()
    static let waitTimeout: TimeInterval = 1.0
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func expectation(for condition: @autoclosure @escaping () -> Bool, description: String = "") -> XCTestExpectation {
        let predicate = NSPredicate { _, _ in
            return condition()
        }
        
        return XCTNSPredicateExpectation(predicate: predicate, object: nil)
    }
    
    @discardableResult
    func wait(for condition: @escaping () -> Bool, description: String = "", timeout: TimeInterval = UITests.waitTimeout) -> Bool {
        guard !condition() else { return false }
        let expect = expectation(for: condition(), description: description)
        return XCTWaiter.wait(for: [expect], timeout: timeout).bool()
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

