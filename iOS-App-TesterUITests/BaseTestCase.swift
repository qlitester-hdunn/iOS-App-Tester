//
//  BaseTestCase.swift
//  iOS-App-TesterUITests
//
//  Created by Matt Roberts on 4/11/22.
//
import XCTest

class BaseTestCase: XCTestCase {
    override func setUp() {
        super.setUp()
        print("Set-up Base")
    }
    override func tearDown() {
        super.tearDown()
        print("Tear-down Base")
    }
}
