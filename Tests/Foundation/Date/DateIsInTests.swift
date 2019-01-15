//
//  DateIsInTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/20.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DateIsInTests: XCTestCase {

    func testIsInThePast() {
        XCTAssertTrue(Date().addingTimeInterval(-Date.timeIntervalPerDay).isInThePast)
    }

    func testIsInTheFuture() {
        XCTAssertTrue(Date().addingTimeInterval(Date.timeIntervalPerDay).isInTheFuture)
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

    func testIsInYesterday() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .day)
        let yesterday = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(yesterday!.isInYesterday(in: calendar))
    }

    func testIsInToday() {
        XCTAssertTrue(Date().isInToday())
    }

    func testIsInTomorrow() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .day)
        let tomorrow = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(tomorrow!.isInTomorrow(in: calendar))
    }

    func testIsInThisWeek() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .day)
        let yesterday = calendar.date(byAdding: dateComponents, to: Date())
        dateComponents.setValue(1, for: .day)
        let tomorrow = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(yesterday!.isInWeekday(in: calendar) || tomorrow!.isInWeekday(in: calendar))
    }

    func testIsInNextWeek() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .weekOfYear)
        let nextWeek = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(nextWeek!.isInNextWeek(in: calendar)!)
    }

    func testIsInThisMonth() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .day)
        let yesterday = calendar.date(byAdding: dateComponents, to: Date())
        dateComponents.setValue(1, for: .day)
        let tomorrow = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(yesterday!.isInThisMonth(in: calendar) || tomorrow!.isInThisMonth(in: calendar))
    }

    func testIsInNextMonth() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .month)
        let nextMonth = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(nextMonth!.isInNextMonth(in: calendar)!)
    }

    func testIsInThisYear() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .day)
        let yesterday = calendar.date(byAdding: dateComponents, to: Date())
        dateComponents.setValue(1, for: .day)
        let tomorrow = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(yesterday!.isInThisYear(in: calendar) || tomorrow!.isInThisYear(in: calendar))
    }

    func testIsInNextYear() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .year)
        let nextYear = calendar.date(byAdding: dateComponents, to: Date())
        XCTAssertTrue(nextYear!.isInNextYear(in: calendar)!)
    }

    func testIsWeekend() {
        XCTAssertTrue(Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * -1).isInWeekend())
    }

    func testIsWeekday() {
        XCTAssertTrue(Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 1).isInWeekday())
    }

    func testIsInTheMorning() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 3).isInTheMorning(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 6).isInTheMorning(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 9).isInTheMorning(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 12).isInTheMorning(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 15).isInTheMorning(in: calendar))
    }

    func testIsInTheAfternoon() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 12).isInTheAfternoon(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 15).isInTheAfternoon(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 18).isInTheAfternoon(in: calendar))
    }

    func testIsInTheEvening() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 15).isInTheEvening(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 18).isInTheEvening(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 21).isInTheEvening(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 24).isInTheEvening(in: calendar))
    }

    func testIsAtNight() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertTrue(date.isAtNight(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 3).isAtNight(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 6).isAtNight(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 18).isAtNight(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 21).isAtNight(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 24).isAtNight(in: calendar))
    }

    func testIsAtNoon() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertFalse(date.isAtNoon(in: calendar))
        XCTAssertTrue(date.addingTimeInterval(Date.timeIntervalPerHour * 12).isAtNoon(in: calendar))
    }

    func testIsAtMidnight() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        XCTAssertTrue(date.isAtMidnight(in: calendar))
        XCTAssertFalse(date.addingTimeInterval(Date.timeIntervalPerHour * 12).isAtMidnight(in: calendar))
    }
}
