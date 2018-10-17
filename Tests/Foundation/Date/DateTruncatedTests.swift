//
//  DateTruncatedTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/28.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateTruncatedTests: XCTestCase {
    
    func testTruncatedAt() {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        // "2001-02-20 07:07:07 +0000"
        let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0)
        XCTAssertEqual(date.truncated(at: [.month, .day], in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0))
        XCTAssertEqual(date.truncated(at: [.weekOfYear], in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0))
        XCTAssertEqual(date.truncated(at: [.weekOfMonth], in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 29 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0))
        XCTAssertEqual(date.truncated(at: [.hour, .minute], in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + 7.0))
        XCTAssertEqual(date.truncated(at: [.second, .nanosecond], in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7))
        XCTAssertEqual(date.truncated(at: [.day, .minute], in: calendar)!, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 31.0 + Date.timeIntervalPerHour * 7.0 + 7.0))
    }
    
    func testTruncatedFrom() {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        // "2001-02-20 07:07:07 +0000"
        let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0)
        XCTAssertEqual(date.truncated(from: .month, in: calendar)!, Date(timeIntervalSinceReferenceDate: 0))
        XCTAssertEqual(date.truncated(from: .day, in: calendar)!.description, "2001-02-01 00:00:00 +0000")
        XCTAssertEqual(date.truncated(from: .hour, in: calendar)!.description, "2001-02-20 00:00:00 +0000")
        XCTAssertEqual(date.truncated(from: .minute, in: calendar)!.description, "2001-02-20 07:00:00 +0000")
        XCTAssertEqual(date.truncated(from: .second, in: calendar)!.description, "2001-02-20 07:07:00 +0000")
        XCTAssertEqual(date.truncated(from: .nanosecond, in: calendar)!.description, "2001-02-20 07:07:07 +0000")
    }
    
}
