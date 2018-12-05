//
//  DateIntervalDurationComponentTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/8.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateIntervalDurationComponentTests: XCTestCase {

    func testDurationComponent() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: Date.timeIntervalPerWeek)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        XCTAssertEqual(dateInterval.durationComponent(.year, in: calendar)!, 0)
        XCTAssertEqual(dateInterval.durationComponent(.month, in: calendar)!, 0)
        XCTAssertEqual(dateInterval.durationComponent(.weekOfMonth, in: calendar)!, 1)
        XCTAssertEqual(dateInterval.durationComponent(.day, in: calendar)!, 7)
        XCTAssertEqual(dateInterval.durationComponent(.hour, in: calendar)!, 7 * 24)
        XCTAssertEqual(dateInterval.durationComponent(.minute, in: calendar)!, 7 * 24 * 60)
        XCTAssertEqual(dateInterval.durationComponent(.second, in: calendar)!, 7 * 24 * 60 * 60)
        XCTAssertNil(dateInterval.durationComponent(.calendar, in: calendar))
    }

    func testComponentDictionary() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: Date.timeIntervalPerWeek * 58 + Date.timeIntervalPerDay + Date.timeIntervalPerHour + Date.timeIntervalPerMinute + 1.0)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dictionary = dateInterval.durationComponentDictionary([.era, .year, .month, .weekOfMonth, .day, .hour, .minute, .second], in: calendar)
        XCTAssertEqual(dictionary[.era], 0)
        XCTAssertEqual(dictionary[.year], 1)
        XCTAssertEqual(dictionary[.month], 1)
        XCTAssertEqual(dictionary[.weekOfMonth], 1)
        XCTAssertEqual(dictionary[.day], 4)
        XCTAssertEqual(dictionary[.hour], 1)
        XCTAssertEqual(dictionary[.minute], 1)
        XCTAssertEqual(dictionary[.second], 1)
    }

}
