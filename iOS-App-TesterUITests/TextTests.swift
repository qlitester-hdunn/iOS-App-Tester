//
//  TextTests.swift
//  iOS-App-TesterUITests
//
//  Created by Matt Roberts on 4/11/22.
//
import XCTest

class TextTest: TextCase {
    func test_firstTest() {
        continueAfterFailure=false
        print("Running tests...")
        let app=XCUIApplication()
        app.launch()
        let typeTextButton = app.buttons["Type Text"]
        XCTAssert(typeTextButton.exists)
        typeTextButton.tap()
        let query = app.descendants(matching: .any).containing(NSPredicate(block: { object, _ in
            guard let attributes = object as? XCUIElementAttributes, let value=attributes.value as? String else {
                return false
            }
            return value == "Hello,World"
        }))
        let textView = query.allElementsBoundByAccessibilityElement.first
        textView?.tap()
        XCTAssert(app.keyboards.count>0)
    }
    
    func test_firstTest2() {
        print("Running tests 2...")
        let app=XCUIApplication()
        app.launch()
        let listAdapaterButton = app.buttons["Custom List Adapter"]
        listAdapaterButton.tap()
        findElementWithLabelContaining(string: "Drive a Chevrolet Chevelle Malibu")
        findElementWithLabelContaining(string: "with 130 HP!")
        findElementWithLabelContaining(string: "Drive a Buick Skylark 320")
    }
    
    func findElementWithLabelContaining(string: String) {
        let app=XCUIApplication()
        let query = app.descendants(matching: .any).containing(NSPredicate(block: { object, _ in
            guard let attributes = object as? XCUIElementAttributes else {
                return false
            }
            return attributes.label.contains(string)
        }))
        let element = query.allElementsBoundByAccessibilityElement.first
        if let element=element {
            XCTAssert(element.exists)
        } else {
            XCTFail()
        }
    }
    
    func test_enterText() {
        //MainScreen().verifyScreen()
            //.tapButton()
    }
}
