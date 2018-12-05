//
//  Date+Truncated.swift
//  SExtensions
//
//  Created by Ray on 2018/7/28.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {

    /// Returns a date by truncating the components or nil.
    ///
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0)
    ///     print(date.truncated(at: [.month, .day], in: calendar))
    ///     // Prints "Optional(2001-02-01 00:07:07 +0000)"
    ///
    /// - Parameters:
    ///   - components: A component array.
    ///   - calendar: A calendar.
    /// - Returns: A date or nil.
    func truncated(at components: [Calendar.Component], in calendar: Calendar) -> Date? {
        var dictionary = [Calendar.Component: Int]()
        for component in components {
            switch component {
            case .yearForWeekOfYear:
                dictionary[.yearForWeekOfYear] = 0
            case .year:
                dictionary[.year] = 0
            case .month:
                dictionary[.month] = 1
            case .weekOfYear:
                dictionary[.weekOfYear] = 1
            case .weekOfMonth:
                dictionary[.weekOfMonth] = 1
            case .weekday:
                dictionary[.weekday] = 1
            case .day:
                dictionary[.day] = 1
            case .hour:
                dictionary[.hour] = 0
            case .minute:
                dictionary[.minute] = 0
            case .second:
                dictionary[.second] = 0
            case .nanosecond:
                dictionary[.nanosecond] = 0
            default:
                break
            }
        }
        return updatingComponentDictionary(dictionary, in: calendar)
    }

    /// Returns a date by truncating the components starting from a given
    /// component or nil.
    ///
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///      calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerDay * 50.0 + Date.timeIntervalPerHour * 7.0 + Date.timeIntervalPerMinute * 7 + 7.0)
    ///     print(date.truncated(from: .day, in: calendar))
    ///     // Prints "Optional(2001-02-01 00:00:00 +0000)"
    ///
    /// - Parameters:
    ///   - component: A component.
    ///   - calendar: A calendar.
    /// - Returns: A date or nil.
    func truncated(from component: Calendar.Component, in calendar: Calendar) -> Date? {
        var components = [Calendar.Component]()
        switch component {
        case .month:
            components = [.month, .day, .hour, .minute, .second, .nanosecond]
        case .day:
            components = [.day, .hour, .minute, .second, .nanosecond]
        case .hour:
            components = [.hour, .minute, .second, .nanosecond]
        case .minute:
            components = [.minute, .second, .nanosecond]
        case .second:
            components = [.second, .nanosecond]
        case .nanosecond:
            components = [.nanosecond]
        default:
            components = []
        }
        return truncated(at: components, in: calendar)
    }

}
