//
//  DateIntervalStringTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateIntervalStringTests: XCTestCase {

    func testStringDateStyle() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let locale = Locale(identifier: "en")
        let string = dateInterval.string(dateStyle: .medium, timeStyle: .short, calendar: calendar, timeZone: timeZone, locale: locale)
        XCTAssertEqual(string, "Jan 1, 2001 at 12:00 AM - 12:01 AM")
        let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: Date.timeIntervalPerDay)
        let nextString = nextDateInterval.string(dateStyle: .medium, timeStyle: .short, calendar: calendar, timeZone: timeZone, locale: locale)
        XCTAssertEqual(nextString, "Jan 1, 2001 at 12:00 AM - Jan 2, 2001 at 12:00 AM")
    }

    func testStringDateFormat() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let dateFormat = "yyyy.MM.dd 'at' HH:mm:ss Z"
        let string = dateInterval.string(dateFormat: dateFormat, calendar: calendar, timeZone: timeZone)
        XCTAssertEqual(string, "2001.01.01 at 00:00:00 +0000 - 2001.01.01 at 00:00:01 +0000")
    }

}
