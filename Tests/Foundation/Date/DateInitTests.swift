//
//  DateInitTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/15/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateInitTests: XCTestCase {
    
    func testInitString() {
        let date = Date(string: "2018.07.15 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: Calendar(identifier: Calendar.Identifier.gregorian))
        XCTAssertEqual(date!.description, "2018-07-15 00:00:00 +0000")
        XCTAssertNil(Date(string: "00:00:00", dateFormat: "yyyy", calendar: Calendar(identifier: Calendar.Identifier.gregorian)))
    }
    
    func testInitCalendar() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let referenceDate = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertTrue(calendar.isDate(referenceDate, inSameDayAs: Date(calendar: calendar, timeZone: timeZone, year: 2001)!))
        XCTAssertTrue(calendar.isDate(referenceDate, inSameDayAs: Date(calendar: calendar, timeZone: timeZone, year: 2001, month: 1)!))
        XCTAssertTrue(calendar.isDate(referenceDate, inSameDayAs: Date(calendar: calendar, timeZone: timeZone, year: 2001, month: 1, day: 1)!))
        XCTAssertTrue(calendar.isDate(referenceDate, inSameDayAs: Date(calendar: calendar, timeZone: timeZone, year: 2001, month: 1, day: 1, hour: 0)!))
        XCTAssertTrue(calendar.isDate(referenceDate, inSameDayAs: Date(calendar: calendar, timeZone: timeZone, year: 2001, month: 1, day: 1, hour: 0, minute: 0, second: 0)!))
    }
    
}
