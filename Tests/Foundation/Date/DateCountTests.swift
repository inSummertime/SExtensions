//
//  DateCountTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/25.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DateCountTests: XCTestCase {

    func testDayCountThisMonth() {
        let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerWeek * 5)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        XCTAssertEqual(date.dayCountThisMonth(in: calendar), 28)
    }

    func testDayCountThisYear() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertEqual(date.dayCountThisYear(in: calendar), 365)
    }

    func testWeekCountThisMonth() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertEqual(date.weekCountThisMonth(in: calendar), 5)
    }

    func testWeekCountThisYear() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertEqual(date.weekCountThisYear(in: calendar), 53)
    }
}
