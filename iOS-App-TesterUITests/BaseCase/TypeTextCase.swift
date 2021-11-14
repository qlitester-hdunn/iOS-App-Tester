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
    var textField: XCUIElement!
    var labelTypeText: XCUIElement!
    
    
    override func setUp() {
        super.setUp()
        headingText = app.staticTexts["Type Text"].firstMatch
        textView = self.app.textViews["Hello,World"].firstMatch
        textField = self.app.textViews["typeTextField"]
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
    func verifyTextField(){
        XCTAssertTrue(textField.exists)
    }
    func verifyTextView(){
        XCTAssertTrue(textView.exists)
    }
    
    func dismissKeyboard(){
        
        if app.keyboards.buttons["Hide keyboard"].exists {
            app.keyboards.buttons["Hide keyboard"].tap()
        }
        if app.keyboards.buttons["Dismiss"].exists {
            app.keyboards.buttons["Dismiss"].tap()
        }
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
            default:
                print(String(describing: "Element '\(id)' does not exist"))
            }
        })
    }
}
extension XCUIElement {
    //    public func clear() {
    //        guard let stringValue = self.value as? String else {
    //            XCTFail("Tried to clear and enter text into a non string value")
    //            return
    //        }
    //
    //        let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
    //        lowerRightCorner.tap()
    //
    //        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
    //        self.typeText(deleteString)
    //    }
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
