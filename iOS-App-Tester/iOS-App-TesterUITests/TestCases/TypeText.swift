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

class TypeText: iOS_App_TesterUITests {
    static var timeout: TimeInterval = 1.0
    let identifierStrings = ["Hello,World"]
//    func expectation(for condition: @autoclosure @escaping () -> Bool, description: String = "") -> XCTestExpectation {
//        let predicate = NSPredicate { _, _ in
//            return condition()
//        }
//
//        return XCTNSPredicateExpectation(predicate: predicate, object: nil)
//    }
    
//    @discardableResult
//    func wait(for condition: @autoclosure @escaping () -> Bool, description: String = "", timeout: TimeInterval = timeout) -> Bool {
//        guard !condition() else { return false }
//        let expect = expectation(for: condition(), description: description)
//        return XCTWaiter.wait(for: [expect], timeout: timeout).bool()
//    }
    
    
    func testExample() {
        
        let headingText: XCUIElement = self.app.staticTexts["iOS-App-Tester"].firstMatch
        let textView: XCUIElement = self.app.textViews["Hello,World"].firstMatch
        let labelTypeText: XCUIElement = self.app.staticTexts["Type Text"].firstMatch
        let backButton: XCUIElement = self.app.images["arrow.left"].firstMatch
        
        func navigateToTextType() -> Void {
            
//            let condition: () -> Bool = {
//                return self.app.buttons["Type Text"].firstMatch.exists
//
//            }
        
//            wait(for: condition(), description: "Wait for Type Text button", timeout: TypeText.timeout)
            self.app.buttons["Type Text"].firstMatch.tap()
        }
        
        func naviateToCustomListAdapter(){
            self.app.buttons["Custom List Adapter"].firstMatch.tap()
        }
        
        func naviateToTop(){
//            self.app.helpTags["Swipe down with three fingers to reveal notifications., Swipe up with three fingers to reveal the control center, Double-tap to scroll to top"].firstMatch.tap()
            self.app.coordinate(withNormalizedOffset: .zero).tap()
        }
        
        func verifyBackButton(){
            backButton.tap()
            XCTAssert(self.app.buttons["Type Text"].firstMatch.exists)
        }
        
        func verifyButtonCount(){
            XCTAssert(self.app.buttons.count == 10)
            print("Number of Buttons: \(self.app.buttons.count)")
        }
        
        func verifyCanType(){
            self.app.textViews.firstMatch.tap()
            XCTAssert(self.app.keyboards.count > 0)
            
        }
        
        func verifyHeadingText(){
            XCTAssert(headingText.label == "iOS-App-Tester")
        }
        
        func verifyCanScrollDown(){
            let tableView = app.descendants(matching: .table).firstMatch
            guard let lastCell = tableView.cells.allElementsBoundByIndex.last else {return}
            var count = 0
            
            while (lastCell.isHittable == false){
                app.swipeUp()
                count += 1
            }
            XCTAssert(count > 0)
        }
        
        func verifyTextViewLabel(){
            XCTAssert(labelTypeText.label == "Type Text")
            
        }
        func verifyTextView(){
            XCTAssert(textView.exists)
        }
        
        
//        func waitForDisplay(for identifiers: [String], type: XCUIElement.ElementType? = nil) -> Void {
//            identifiers.forEach({
//                (id) in
//                let type = type ?? XCUIElement.ElementType.staticText
//                    switch (type) {
//                    case XCUIElement.ElementType.staticText:
//                        wait(for:  self.app.staticTexts[id].firstMatch.exists )
//                    case XCUIElement.ElementType.textField:
//                        wait(for:  self.app.textFields[id].firstMatch.exists )
//                    default:
//                        print(String(describing: "Element '\(id)' does not exist"))
//                    }
//            })
//        }
        
        navigateToTextType()
        verifyButtonCount()
//        waitForDisplay(for: identifierStrings, type)
        verifyHeadingText()
        verifyTextViewLabel()
        verifyTextView()
        verifyCanType()
        verifyBackButton()
        naviateToCustomListAdapter()
        verifyCanScrollDown()
        naviateToTop()
    
    }
}
