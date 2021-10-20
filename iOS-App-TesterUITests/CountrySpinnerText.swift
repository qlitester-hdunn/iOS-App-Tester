//
//  SpinnerText.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 9/8/21.
//

import Foundation
import XCTest

class CountrySpinnerText: UITests {
    func navigateToFirstSpinnerSelection() -> Void {
        
        let condition: () -> Bool = {
            self.app.buttons["Spinner Selection"].firstMatch.exists
        }
        
        wait(for: {self.app.buttons["Spinner Selection"].firstMatch.exists}, description: "Wait for button", timeout: UITests.waitTimeout)
        self.app.buttons["Spinner Selection"].firstMatch.tap()
    }
    func verifyCountriesText(){
        let title: XCUIElement = app.staticTexts["Countries"].firstMatch
        XCTAssert(title.exists)
    }
    func testExample() throws {
        navigateToFirstSpinnerSelection()
        //verify(text: "Countries")
    }
}
