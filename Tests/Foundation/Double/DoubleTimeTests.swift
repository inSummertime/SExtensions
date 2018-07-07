//
//  DoubleTimeTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DoubleTimeTests: XCTestCase {
    
    func testMilliseconds() {
        XCTAssertEqual(1.0.milliseconds, 1000.0)
    }
    
    func testSeconds() {
        XCTAssertEqual(1.0.seconds, 1.0)
    }
    
    func testMinutes() {
        XCTAssertEqual(60.0.minutes, 1.0)
    }
    
    func testHours() {
        XCTAssertEqual(3600.0.hours, 1.0)
    }
    
    func testDays() {
        XCTAssertEqual(86400.0.days, 1.0)
    }
    
}
