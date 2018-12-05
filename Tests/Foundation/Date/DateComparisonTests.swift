//
//  DateComparisonTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/31.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateComparisonTests: XCTestCase {

    func testEarliest() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let previous = date.addingTimeInterval(-1.0)
        let next = date.addingTimeInterval(1.0)
        XCTAssertEqual(Date.earliest(in: [previous, date, next])!, previous)
        XCTAssertEqual(Date.earliest(in: [date])!, date)
        XCTAssertNil(Date.earliest(in: []))
    }

    func testLatest() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let previous = date.addingTimeInterval(-1.0)
        let next = date.addingTimeInterval(1.0)
        XCTAssertEqual(Date.latest(in: [previous, date, next])!, next)
        XCTAssertEqual(Date.latest(in: [date])!, date)
        XCTAssertNil(Date.latest(in: []))
    }

}
