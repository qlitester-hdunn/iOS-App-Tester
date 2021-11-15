//
//  BaseScreen.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 11/15/21.
//

import Foundation
import XCTest
class BaseScreen {
    let app = XCUIApplication()
    
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
    
    func waitForDisplay(for identifiers: [String], type: XCUIElement.ElementType? = nil) -> Void {
        identifiers.forEach({
            (id) in
            print("type \(String(describing: type))")
            let type = type ?? XCUIElement.ElementType.staticText
            switch (type) {
            case XCUIElement.ElementType.staticText:
                wait(for: { self.app.staticTexts[id].firstMatch.exists } )
            case XCUIElement.ElementType.textField:
                wait(for: { self.app.textFields[id].firstMatch.exists } )
            case XCUIElement.ElementType.textView:
                wait(for: { self.app.textViews[id].firstMatch.exists } )
            default:
                print(String(describing: "Element '\(id)' does not exist"))
            }
        })
    }
}

extension XCUIElement {
    
    func clear() {
        let app: XCUIApplication = XCUIApplication()
        if let stringValue = self.value as? String {
            let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
            lowerRightCorner.tap()
            
            let chars = stringValue.count
            var count = 0
            while( count < chars){
                app.keys["delete"].tap()
                count += 1
            }
        }
    }
    
    func waitForDisappear(timeout: TimeInterval) -> Bool {
        let result = XCTWaiter().wait(for: [waitForDisappearExpectation()],
                                      timeout: timeout)
        return result == .completed
    }
    
    func waitForDisappearExpectation() -> XCTestExpectation {
        let predicate = NSPredicate(format: "exists == false")
        return XCTNSPredicateExpectation(predicate: predicate, object: self)
    }
}


