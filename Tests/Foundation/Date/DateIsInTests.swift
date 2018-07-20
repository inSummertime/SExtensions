//
//  DateIsInTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/20.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateIsInTests: XCTestCase {
    
    func testIsInThePast() {
        let yesterday = Date().addingTimeInterval(-Date.timeIntervalPerDay)
        XCTAssertTrue(yesterday.isInThePast)
    }
    
    func testIsInTheFuture() {
        let tomorrow = Date().addingTimeInterval(Date.timeIntervalPerDay)
        XCTAssertTrue(tomorrow.isInTheFuture)
    }
    
    func testIsInLastYear() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .year)
        let lastYear = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(lastYear!.isInLastYear(in: calendar)!)
    }
    
    func testIsInLastMonth() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .month)
        let lastMonth = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(lastMonth!.isInLastMonth(in: calendar)!)
    }
    
    func testIsInLastWeek() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .weekOfYear)
        let lastWeek = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(lastWeek!.isInLastWeek(in: calendar)!)
    }
    
    func testIsInNextWeek() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .weekOfYear)
        let nextWeek = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(nextWeek!.isInNextWeek(in: calendar)!)
    }
    
    func testIsInNextMonth() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .month)
        let nextMonth = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(nextMonth!.isInNextMonth(in: calendar)!)
    }
    
    func testIsInNextYear() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .year)
        let nextYear = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(nextYear!.isInNextYear(in: calendar)!)
    }
    
}
