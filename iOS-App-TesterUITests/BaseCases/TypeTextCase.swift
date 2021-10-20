//
//  TypeTextCase.swift
//  iOS-App-TesterUITests
//
//  Created by Dorian Bizgan on 10/19/21.
//

import XCTest

class TypeTextCase: UITests{
    
    var headingText: XCUIElement!
    var textView: XCUIElement!
    var buttonTypeText: XCUIElement!
    var backButton: XCUIElement!
    var nonBackButton: XCUIElement!
    var labelTypeText: XCUIElement!
    
    var typeTextTimeout: TimeInterval = 1.0
    let identifierStrings = [Strings.HelloWorld]
    
    override func setUp() {
        super.setUp()
        headingText = self.app.staticTexts[Strings.iOSAppTester].firstMatch
        textView = self.app.textViews[Strings.HelloWorld].firstMatch
        buttonTypeText = self.app.buttons[Strings.TypeText].firstMatch
        backButton = self.app.images[Strings.arrowleft].firstMatch
        nonBackButton = self.app.images[Strings.arrowright].firstMatch
        labelTypeText = self.app.staticTexts[Strings.TypeText].firstMatch
    }
    
    func navigateToTextType() -> Void {
        buttonTypeText.tap()
    }
    
    func naviateToCustomListAdapter(){
        self.app.buttons[Strings.CustomListAdapter].firstMatch.tap()
    }
    
    func navigateToTextViews(){
        textView.tap()
    }
    
    func tapBackButton(){
        backButton.tap()
    }
    
    func verifyBackButton(){
        XCTAssert(self.backButton.exists)
    }
    
    func verifyButtonCount(){
        XCTAssert(self.app.buttons.count == 10)
    }
    
    func verifyKeyboardAppears(){
        XCTAssert(self.app.keyboards.count > 0)
    }
    
    func verifyHeadingText(){
        XCTAssert(headingText.label == Strings.iOSAppTester)
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
        XCTAssert(labelTypeText.label == Strings.TypeText)
    }
    
    func verifyTextViewExists(){
        XCTAssert(textView.exists)
    }
    
}
