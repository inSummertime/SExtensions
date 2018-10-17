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
    
    func testUTCComponents() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertEqual(date.yearUTC, 2001)
        XCTAssertEqual(date.monthUTC, 1)
        XCTAssertEqual(date.dayUTC, 1)
        XCTAssertEqual(date.hourUTC, 0)
        XCTAssertEqual(date.minuteUTC, 0)
        XCTAssertEqual(date.secondUTC, 0)
    }
    
    func testComponentInCalendar() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertEqual(date.component(.year, in: calendar)!, 2001)
        XCTAssertEqual(date.component(.month, in: calendar)!, 01)
        XCTAssertEqual(date.component(.day, in: calendar)!, 01)
        XCTAssertEqual(date.component(.hour, in: calendar)!, 0)
        XCTAssertEqual(date.component(.minute, in: calendar)!, 0)
        XCTAssertEqual(date.component(.second, in: calendar)!, 0)
        XCTAssertNil(date.component(.calendar, in: calendar))
        XCTAssertNil(date.component(.timeZone, in: calendar))
    }
    
    func testSubscript() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertTrue(date[.year]! == 2001 || date[.year]! == 2000)
        XCTAssertTrue(date[.month]! == 1 || date[.month]! == 12)
        XCTAssertTrue(date[.day]! == 01 || date[.day]! == 31)
        XCTAssertNil(date[.calendar])
        XCTAssertNil(date[.timeZone])
    }
    
    func testComponentSinceDateInCalendar() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let sometimeNextYear = date.addingTimeInterval(Date.timeIntervalPerWeek * 77)
        XCTAssertEqual(sometimeNextYear.component(.era, since: date, in: calendar)!, 0)
        XCTAssertEqual(sometimeNextYear.component(.year, since: date, in: calendar)!, 1)
        XCTAssertEqual(sometimeNextYear.component(.yearForWeekOfYear, since: date, in: calendar)!, 1)
        XCTAssertEqual(sometimeNextYear.component(.month, since: date, in: calendar)!, 17)
        XCTAssertEqual(sometimeNextYear.component(.weekOfYear, since: date, in: calendar)!, 77)
        XCTAssertEqual(sometimeNextYear.component(.weekOfMonth, since: date, in: calendar)!, 77)
        XCTAssertEqual(sometimeNextYear.component(.weekdayOrdinal, since: date, in: calendar)!, 77)
        XCTAssertEqual(sometimeNextYear.component(.weekday, since: date, in: calendar)!, 77 * 7)
        XCTAssertEqual(sometimeNextYear.component(.day, since: date, in: calendar)!, 77 * 7)
        XCTAssertEqual(sometimeNextYear.component(.hour, since: date, in: calendar)!, 77 * 7 * 24)
        XCTAssertEqual(sometimeNextYear.component(.minute, since: date, in: calendar)!, 77 * 7 * 24 * 60)
        XCTAssertEqual(sometimeNextYear.component(.second, since: date, in: calendar)!, 77 * 7 * 24 * 60 * 60)
        XCTAssertNil(sometimeNextYear.component(.calendar, since: date, in: calendar))
    }
    
    func testComponentDictionary() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let sometimeNextYear = date.addingTimeInterval(Date.timeIntervalPerWeek * 77 + Date.timeIntervalPerDay + Date.timeIntervalPerHour + Date.timeIntervalPerMinute + 1.0)
        let dictionary = sometimeNextYear.componentDictionary([.era, .year, .month, .weekOfMonth, .day, .hour, .minute, .second], since: date, in: calendar)
        XCTAssertEqual(dictionary[.era], 0)
        XCTAssertEqual(dictionary[.year], 1)
        XCTAssertEqual(dictionary[.month], 5)
        XCTAssertEqual(dictionary[.weekOfMonth], 3)
        XCTAssertEqual(dictionary[.day], 3)
        XCTAssertEqual(dictionary[.hour], 1)
        XCTAssertEqual(dictionary[.minute], 1)
        XCTAssertEqual(dictionary[.second], 1)
    }
    
}
