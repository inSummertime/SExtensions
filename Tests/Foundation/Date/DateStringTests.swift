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
    
}
