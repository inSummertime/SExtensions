//
//  DateOperationTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateOperationTests: XCTestCase {
    
    func testAddingComponentDictionary() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let nextSecond = date.addingTimeInterval(1)
        XCTAssertEqual(date.addingComponentDictionary([.second: 1], in: calendar), nextSecond)
        let nextMinite = date.addingTimeInterval(Date.timeIntervalPerMinute)
        XCTAssertEqual(date.addingComponentDictionary([.minute: 1], in: calendar), nextMinite)
        let nextHour = date.addingTimeInterval(Date.timeIntervalPerHour)
        XCTAssertEqual(date.addingComponentDictionary([.hour: 1], in: calendar), nextHour)
        let nextDay = date.addingTimeInterval(Date.timeIntervalPerDay)
        XCTAssertEqual(date.addingComponentDictionary([.day: 1], in: calendar), nextDay)
        
        let today = Date(string: "2018.07.16 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: calendar)
        let yesterday = Date(string: "2018.07.15 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: calendar)
        XCTAssertEqual(today!.addingComponentDictionary([.day: -1], in: calendar), yesterday!)
    }
    
    func testUpdatingComponentDictionary() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        let nextSecond = date.addingTimeInterval(1)
        XCTAssertEqual(date.updatingComponentDictionary([.second: 1], in: calendar), nextSecond)

        let nextMinute = date.addingTimeInterval(Date.timeIntervalPerMinute)
        XCTAssertEqual(date.updatingComponentDictionary([.minute: 1], in: calendar), nextMinute)
        
        let nextHour = date.addingTimeInterval(Date.timeIntervalPerHour)
        XCTAssertEqual(date.updatingComponentDictionary([.hour: 1], in: calendar), nextHour)
        
        let nextDay = date.addingTimeInterval(Date.timeIntervalPerDay)
        XCTAssertEqual(date.updatingComponentDictionary([.day: 2], in: calendar), nextDay)
        
        let nextDayHourMinuteSecond = date.addingTimeInterval(Date.timeIntervalPerDay + Date.timeIntervalPerHour + Date.timeIntervalPerMinute)
        XCTAssertEqual(date.updatingComponentDictionary([.day: 2, .hour: 1, .minute: 1], in: calendar), nextDayHourMinuteSecond)
        
        let nextDayHours = date.addingTimeInterval(Date.timeIntervalPerDay + Date.timeIntervalPerHour * 24)
        XCTAssertEqual(date.updatingComponentDictionary([.day: 2, .hour: 24], in: calendar), nextDayHours)
        
        XCTAssertNil(date.updatingComponentDictionary([.day: 2, .hour: 1, .minute: 0], in: calendar))
        XCTAssertNil(date.updatingComponentDictionary([.day: 2, .hour: 1, .minute: -1], in: calendar))
    }
    
}
