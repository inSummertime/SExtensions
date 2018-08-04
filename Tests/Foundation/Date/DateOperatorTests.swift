//
//  DateOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/26.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateOperatorTests: XCTestCase {
    
    func testSubtraction() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let nextDay = date.addingTimeInterval(Date.timeIntervalPerDay)
        XCTAssertEqual(nextDay - date, Date.timeIntervalPerDay)
        XCTAssertEqual(date - nextDay, -Date.timeIntervalPerDay)
    }
    
    func testLessThanOrEqualTo() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let next = date.addingTimeInterval(1)
        XCTAssertTrue(date <= next)
        XCTAssertTrue(date <= Date(timeIntervalSinceReferenceDate: 0))
    }
    
    func testGreaterThanOrEqualTo() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let next = date.addingTimeInterval(1)
        XCTAssertTrue(next >= date)
        XCTAssertTrue(date >= Date(timeIntervalSinceReferenceDate: 0))
    }
    
}
