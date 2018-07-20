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
    var isInThePast: Bool {
        return self < Date()
    }
    
    /// Returns `true` if it is in the future.
    var isInTheFuture: Bool {
        return self > Date()
    }
    
    /// Returns `true` if it is within last year, as defined by the calendar
    /// and calendar's locale.
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
    
}
