//
//  DateTimeIntervalTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/14/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateTimeIntervalTests: XCTestCase {

    func testTimeInterval() {
        XCTAssertEqual(Date.timeIntervalPerWeek / 7.0, Date.timeIntervalPerDay)
        XCTAssertEqual(Date.timeIntervalPerDay / 24.0, Date.timeIntervalPerHour)
        XCTAssertEqual(Date.timeIntervalPerHour / 60.0, Date.timeIntervalPerMinute)
    }

}
