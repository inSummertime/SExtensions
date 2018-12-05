//
//  Date+Start.swift
//  SExtensions
//
//  Created by Ray on 2018/7/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {

    /// Returns the first moment of a given date, as a Date created from the
    /// specified component.
    ///
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0).start(of: .month, in: calendar))
    ///     // Prints "Optional(2001-02-01 00:00:00 +0000)"
    ///
    /// - Parameters:
    ///   - component: A Calendar.Component.
    ///   - calendar: A Calendar.
    /// - Returns: A date created from the specified component.
    func start(of component: Calendar.Component, in calendar: Calendar = Calendar.current) -> Date? {
        var components = Set<Calendar.Component>()
        switch component {
        case .year:
            components = [.year]
        case .yearForWeekOfYear:
            components = [.yearForWeekOfYear]
        case .month:
            components = [.year, .month]
        case .day:
            return calendar.startOfDay(for: self)
        case .hour:
            components = [.year, .month, .day, .hour]
        case .minute:
            components = [.year, .month, .day, .hour, .minute]
        case .second:
            return self
        case .weekOfYear, .weekOfMonth, .weekday:
            components = [.yearForWeekOfYear, .weekOfYear]
        default:
            return nil
        }
        let dateComponents = calendar.dateComponents(components, from: self)
        return calendar.date(from: dateComponents)
    }

    /// Returns the last moment of a given date, as a Date created from the
    /// specified component.
    ///
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0).end(of: .year, in: calendar))
    ///     // Prints "Optional(2001-12-31 23:59:59 +0000)"
    ///
    /// - Parameters:
    ///   - component: A Calendar.Component.
    ///   - calendar: A Calendar.
    /// - Returns: A date created from the specified component.
    func end(of component: Calendar.Component, in calendar: Calendar = Calendar.current) -> Date? {
        if component == .year || component == .month || component == .day || component == .hour || component == .minute || component == .yearForWeekOfYear {
            var dateComponents = DateComponents()
            dateComponents.calendar = calendar
            dateComponents.setValue(1, for: component)
            if let start = start(of: component, in: calendar), let next = calendar.date(byAdding: dateComponents, to: start) {
                var dateComponents = DateComponents()
                dateComponents.calendar = calendar
                dateComponents.setValue(-1, for: .second)
                return calendar.date(byAdding: dateComponents, to: next)
            } else {
                return nil
            }
        } else if component == .weekOfYear || component == .weekOfMonth || component == .weekday {
            var dateComponents = DateComponents()
            dateComponents.calendar = calendar
            dateComponents.setValue(7, for: .day)
            if let start = start(of: component, in: calendar), let next = calendar.date(byAdding: dateComponents, to: start) {
                var dateComponents = DateComponents()
                dateComponents.calendar = calendar
                dateComponents.setValue(-1, for: .second)
                return calendar.date(byAdding: dateComponents, to: next)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }

}
