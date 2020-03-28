//
//  NShapeSetsTests.swift
//  NShapeSetsTests
//
//  Created by Shawn Roller on 11/30/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import XCTest
@testable import NShapeSets
//import TimeHelper

class NShapeSetsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTimeFromSeconds() {
        let time = TimeHelper.getTimeFromSeconds(90)
        XCTAssert(time == "1:30")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
