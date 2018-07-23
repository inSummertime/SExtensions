//
//  DateComponentTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/23.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateComponentTests: XCTestCase {
    
    func testComponents() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertTrue(date.year == 2001 || date.year == 2000)
        XCTAssertTrue(date.month == 1 || date.month == 12)
        XCTAssertTrue(date.day == 01 || date.day == 31)
        XCTAssertEqual(date.minute, 0)
        XCTAssertEqual(date.second, 0)
    }
    
    func testComponent() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertEqual(date.component(.year, in: calendar), 2001)
        XCTAssertEqual(date.component(.month, in: calendar), 01)
        XCTAssertEqual(date.component(.day, in: calendar), 01)
        XCTAssertEqual(date.component(.hour, in: calendar), 0)
        XCTAssertEqual(date.component(.minute, in: calendar), 0)
        XCTAssertEqual(date.component(.second, in: calendar), 0)
    }
    
}
