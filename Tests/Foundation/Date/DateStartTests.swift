//
//  DateStartTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/19.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DateStartTests: XCTestCase {

    func testStart() {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        // "2001-02-20 07:07:07 +0000"
        let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0)
        XCTAssertEqual(date.start(of: .year, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0))
        XCTAssertEqual(date.start(of: .yearForWeekOfYear, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * -8))
        XCTAssertEqual(date.start(of: .month, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 31.0))
        XCTAssertEqual(date.start(of: .hour, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0))
        XCTAssertEqual(date.start(of: .minute, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7))
        XCTAssertEqual(date.start(of: .second, in: calendar)!, date)
        XCTAssertEqual(date.start(of: .weekOfYear, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 48.0))
        XCTAssertEqual(date.start(of: .weekOfMonth, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 48.0))
        XCTAssertEqual(date.start(of: .weekday, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 48.0))
        XCTAssertNil(date.start(of: .quarter, in: calendar))
    }

    func testEnd() {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        // "2001-02-20 07:07:07 +0000"
        let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0)
        XCTAssertEqual(date.end(of: .yearForWeekOfYear, in: calendar)!.description, "2001-12-29 23:59:59 +0000")
        XCTAssertEqual(date.end(of: .year, in: calendar)!.description, "2001-12-31 23:59:59 +0000")
        XCTAssertEqual(date.end(of: .month, in: calendar)!.description, "2001-02-28 23:59:59 +0000")
        XCTAssertEqual(date.end(of: .day, in: calendar)!.description, "2001-02-20 23:59:59 +0000")
        XCTAssertEqual(date.end(of: .hour, in: calendar)!.description, "2001-02-20 07:59:59 +0000")
        XCTAssertEqual(date.end(of: .minute, in: calendar)!.description, "2001-02-20 07:07:59 +0000")
        XCTAssertEqual(date.end(of: .weekOfYear, in: calendar)!.description, "2001-02-24 23:59:59 +0000")
        XCTAssertEqual(date.end(of: .weekOfMonth, in: calendar)!.description, "2001-02-24 23:59:59 +0000")
        XCTAssertEqual(date.end(of: .weekday, in: calendar)!.description, "2001-02-24 23:59:59 +0000")
        XCTAssertNil(date.end(of: .quarter, in: calendar))
    }
}
