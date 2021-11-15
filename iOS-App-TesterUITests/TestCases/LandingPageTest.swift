//
//  LandingPageTest.swift
//  iOS-App-TesterUITests
//
//  Created by Tester on 11/15/21.
//

import Foundation

class LandingPageTest: LandingPageCase {
    func test_showsLandingPage(){
        LandingPageScreen().verifyScreen()
    }
}
