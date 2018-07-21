//
//  Date+Init.swift
//  SExtensions
//
//  Created by Ray on 7/15/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Returns a `Date` initialized by a given string, dateFormat, calendar.
    ///
    ///     print(Date(string: "2018.07.15 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: Calendar(identifier: Calendar.Identifier.gregorian)))
    ///     // Prints "Optional(2018-07-15 00:00:00 +0000)"
    ///
    /// - Parameters:
    ///   - string: A string.
    ///   - dateFormat: A date format.
    ///   - calendar: A calendar.
    init?(string: String, dateFormat: String, calendar: Calendar = .current) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.calendar = calendar
        if let date = dateFormatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    /// Returns a `Date` initialized by a calendar, a time zone and
    /// components.
    ///
    ///     print(Date(calendar: Calendar(identifier: Calendar.Identifier.gregorian), timeZone: TimeZone(secondsFromGMT: 0)!, year: 2001, month: 1, day: 1, hour: 0, minute: 0, second: 0))
    ///     // Prints "Optional(2001-01-01 00:00:00 +0000)"
    ///
    /// - Parameters:
    ///   - calendar: A calendar.
    ///   - timeZone: A time zone.
    ///   - year: Year.
    ///   - month: Month.
    ///   - day: Day.
    ///   - hour: Hour.
    ///   - minute: Minute.
    ///   - second: Second.
    init?(calendar: Calendar = .current, timeZone: TimeZone = .current, year: Int, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        if let date = calendar.date(from: components) {
            self = date
        } else {
            return nil
        }
    }
    
}
