//
//  Date+IsIn.swift
//  SExtensions
//
//  Created by Ray on 2018/7/20.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {

    /// Returns `true` if it is in the past.
    ///
    ///     print(Date().addingTimeInterval(-Date.timeIntervalPerDay).isInThePast)
    ///     // Prints "true"
    var isInThePast: Bool {
        return self < Date()
    }

    /// Returns `true` if it is in the future.
    ///
    ///     print(Date().addingTimeInterval(Date.timeIntervalPerDay).isInTheFuture)
    ///     // Prints "true"
    var isInTheFuture: Bool {
        return self > Date()
    }

    /// Returns `true` if it is within last year, as defined by the calendar
    /// and calendar's locale.
    ///
    ///      let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     var dateComponents = DateComponents()
    ///     dateComponents.calendar = calendar
    ///     dateComponents.setValue(-1, for: .year)
    ///     let lastYear = calendar.date(byAdding: dateComponents, to: Date())
    ///     print(lastYear!.isInLastYear(in: calendar)!)
    ///     // Prints "true"
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within last year.
    func isInLastYear(in calendar: Calendar = Calendar.current) -> Bool? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .year)
        if let lastYear = calendar.date(byAdding: dateComponents, to: Date()) {
            return calendar.isDate(self, equalTo: lastYear, toGranularity: .year)
        } else {
            return nil
        }
    }

    /// Returns `true` if it is within last month, as defined by the calendar
    /// and calendar's locale.
    ///
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     var dateComponents = DateComponents()
    ///     dateComponents.calendar = calendar
    ///     dateComponents.setValue(-1, for: .month)
    ///     let lastMonth = calendar.date(byAdding: dateComponents, to: Date())
    ///     print(lastMonth!.isInLastMonth(in: calendar)!)
    ///     // Prints "true"
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within last month.
    func isInLastMonth(in calendar: Calendar = Calendar.current) -> Bool? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .month)
        if let lastMonth = calendar.date(byAdding: dateComponents, to: Date()) {
            return calendar.isDate(self, equalTo: lastMonth, toGranularity: .month)
        } else {
            return nil
        }
    }

    /// Returns `true` if it is within last week, as defined by the calendar
    /// and calendar's locale.
    ///
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     var dateComponents = DateComponents()
    ///     dateComponents.calendar = calendar
    ///     dateComponents.setValue(-1, for: .weekOfYear)
    ///     let lastWeek = calendar.date(byAdding: dateComponents, to: Date())
    ///     print(lastWeek!.isInLastWeek(in: calendar)!)
    ///     // Prints "true"
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within last week.
    func isInLastWeek(in calendar: Calendar = Calendar.current) -> Bool? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(-1, for: .weekOfYear)
        if let lastWeek = calendar.date(byAdding: dateComponents, to: Date()) {
            return calendar.isDate(self, equalTo: lastWeek, toGranularity: .weekOfYear)
        } else {
            return nil
        }
    }

    /// Returns `true` if it is within yesterday, as defined by the calendar
    /// and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within yesterday.
    func isInYesterday(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDateInYesterday(self)
    }

    /// Returns `true` if it is within today, as defined by the calendar
    /// and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within today.
    func isInToday(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDateInToday(self)
    }

    /// Returns `true` if it is within tomorrow, as defined by the calendar
    /// and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within tomorrow.
    func isInTomorrow(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDateInTomorrow(self)
    }

    /// Returns `true` if it is within this week, as defined by the calendar
    /// and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within this week.
    func isInThisWeek(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }

    /// Returns `true` if it is within next week, as defined by the calendar
    /// and calendar's locale.
    ///
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     var dateComponents = DateComponents()
    ///     dateComponents.calendar = calendar
    ///     dateComponents.setValue(1, for: .weekOfYear)
    ///     let nextWeek = calendar.date(byAdding: dateComponents, to: Date())
    ///     print(nextWeek!.isInNextWeek(in: calendar)!)
    ///     // Prints "true"
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within next week.
    func isInNextWeek(in calendar: Calendar = Calendar.current) -> Bool? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .weekOfYear)
        if let nextWeek = calendar.date(byAdding: dateComponents, to: Date()) {
            return calendar.isDate(self, equalTo: nextWeek, toGranularity: .weekOfYear)
        } else {
            return nil
        }
    }

    /// Returns `true` if it is within this month, as defined by the calendar
    /// and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within this month.
    func isInThisMonth(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }

    /// Returns `true` if it is within next month, as defined by the calendar
    /// and calendar's locale.
    ///
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     var dateComponents = DateComponents()
    ///     dateComponents.calendar = calendar
    ///     dateComponents.setValue(1, for: .month)
    ///     let nextMonth = calendar.date(byAdding: dateComponents, to: Date())
    ///     print(nextMonth!.isInNextMonth(in: calendar)!)
    ///     // Prints "true"
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within next month.
    func isInNextMonth(in calendar: Calendar = Calendar.current) -> Bool? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .month)
        if let nextMonth = calendar.date(byAdding: dateComponents, to: Date()) {
            return calendar.isDate(self, equalTo: nextMonth, toGranularity: .month)
        } else {
            return nil
        }
    }

    /// Returns `true` if it is within this year, as defined by the calendar
    /// and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within this year.
    func isInThisYear(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }

    /// Returns `true` if it is within next year, as defined by the calendar
    /// and calendar's locale.
    ///
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     var dateComponents = DateComponents()
    ///     dateComponents.calendar = calendar
    ///     dateComponents.setValue(1, for: .year)
    ///     let nextYear = calendar.date(byAdding: dateComponents, to: Date())
    ///     print(nextYear!.isInNextYear(in: calendar)!)
    ///     // Prints "true"
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within next year.
    func isInNextYear(in calendar: Calendar = Calendar.current) -> Bool? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.setValue(1, for: .year)
        if let nextYear = calendar.date(byAdding: dateComponents, to: Date()) {
            return calendar.isDate(self, equalTo: nextYear, toGranularity: .year)
        } else {
            return nil
        }
    }

    /// Returns `true` if it is within a weekend period, as defined by the
    /// calendar and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within a weekend.
    func isInWeekend(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDateInWeekend(self)
    }

    /// Returns `true` if it is within a weekday period, as defined by the
    /// calendar and calendar's locale.
    ///
    /// - parameter calendar: A calendar.
    /// - returns: `true` if it is within a weekday.
    func isInWeekday(in calendar: Calendar = Calendar.current) -> Bool {
        return !calendar.isDateInWeekend(self)
    }

    /// Returns `true` if it is within the morning period, as defined by the
    /// calendar and calendar's locale.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.addingTimeInterval(Date.timeIntervalPerHour * 6).isInTheMorning(in: calendar))
    ///     // Prints "true"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: `true` if it is within the morning period.
    func isInTheMorning(in calendar: Calendar = Calendar.current) -> Bool {
        let hour = calendar.component(.hour, from: self)
        return hour >= 6 && hour <= 12
    }

    /// Returns `true` if it is within the afterning period, as defined by
    /// the calendar and calendar's locale.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.addingTimeInterval(Date.timeIntervalPerHour * 15).isInTheAfternoon(in: calendar))
    ///     // Prints "true"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: `true` if it is within the afterning period.
    func isInTheAfternoon(in calendar: Calendar = Calendar.current) -> Bool {
        let hour = calendar.component(.hour, from: self)
        return hour > 12 && hour <= 17
    }

    /// Returns `true` if it is within the evening period, as defined by
    /// the calendar and calendar's locale.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.addingTimeInterval(Date.timeIntervalPerHour * 18).isInTheEvening(in: calendar))
    ///     // Prints "true"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: true` if it is within the evening period.
    func isInTheEvening(in calendar: Calendar = Calendar.current) -> Bool {
        let hour = calendar.component(.hour, from: self)
        return hour > 17 && hour < 20
    }

    /// Returns `true` if it is within the night period, as defined by
    /// the calendar and calendar's locale.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.isAtNight(in: calendar))
    ///     // Prints "true"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: true` if it is within the night period.
    func isAtNight(in calendar: Calendar = Calendar.current) -> Bool {
        let hour = calendar.component(.hour, from: self)
        return hour >= 20 || hour < 6
    }

    /// Returns `true` if it is at noon, as defined by the calendar and
    /// calendar's locale.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.addingTimeInterval(Date.timeIntervalPerHour * 12).isAtNoon(in: calendar))
    ///     // Prints "true"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: true` if it is at noon.
    func isAtNoon(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.component(.hour, from: self) == 12
    }

    /// Returns `true` if it is at midnight, as defined by the calendar and
    /// calendar's locale.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.isAtMidnight(in: calendar))
    ///     // Prints "true"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: true` if it is at midnight.
    func isAtMidnight(in calendar: Calendar = Calendar.current) -> Bool {
        return calendar.component(.hour, from: self) == 0
    }
}
