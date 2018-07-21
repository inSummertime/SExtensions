//
//  DateStringTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateStringTests: XCTestCase {
    
    func testStringDateStyle() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let locale = Locale(identifier: "en")
        let string = date.string(dateStyle: .medium, timeStyle: .short, calendar: calendar, timeZone: timeZone, locale: locale)
        XCTAssertEqual(string, "Jan 1, 2001 at 12:00 AM")
    }
    
    func testStringDateFormat() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let dateFormat = "yyyy.MM.dd 'at' HH:mm:ss Z"
        let string = date.string(dateFormat: dateFormat, calendar: calendar, timeZone: timeZone)
        XCTAssertEqual(string, "2001.01.01 at 00:00:00 +0000")
    }
    
    func testMonth() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let locale = Locale(identifier: "en")
        XCTAssertEqual(date.month(style: .full, calendar: calendar, timeZone: timeZone, locale: locale), "January")
        XCTAssertEqual(date.month(style: .threeLetterAbbreviation, calendar: calendar, timeZone: timeZone, locale: locale), "Jan")
        XCTAssertEqual(date.month(style: .oneLetterAbbreviation, calendar: calendar, timeZone: timeZone, locale: locale), "J")
        XCTAssertEqual(date.month(style: .oneDigit, calendar: calendar, timeZone: timeZone, locale: locale), "1")
        XCTAssertEqual(date.month(style: .twoDigits, calendar: calendar, timeZone: timeZone, locale: locale), "01")
    }
    
    func testDayName() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let timeZone = TimeZone(secondsFromGMT: 0)!
        let locale = Locale(identifier: "en")
        XCTAssertEqual(date.dayName(style: .full, calendar: calendar, timeZone: timeZone, locale: locale), "Monday")
        XCTAssertEqual(date.dayName(style: .threeLetterAbbreviation, calendar: calendar, timeZone: timeZone, locale: locale), "Mon")
        XCTAssertEqual(date.dayName(style: .twoLetterAbbreviation, calendar: calendar, timeZone: timeZone, locale: locale), "Mo")
        XCTAssertEqual(date.dayName(style: .oneLetterAbbreviation, calendar: calendar, timeZone: timeZone, locale: locale), "M")
    }
    
}
