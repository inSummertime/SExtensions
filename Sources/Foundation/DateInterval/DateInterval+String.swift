//
//  DateInterval+String.swift
//  SExtensions
//
//  Created by Ray on 2018/8/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension DateInterval {

    /// Returns a string from a date interval with a date style.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     let timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let locale = Locale(identifier: "en")
    ///     let string = dateInterval.string(dateStyle: .medium, timeStyle: .short, calendar: calendar, timeZone: timeZone, locale: locale)
    ///     print(string)
    ///     // Prints "Jan 1, 2001 at 12:00 AM - 12:01 AM"
    ///
    /// - Parameters:
    ///   - dateStyle: The date style of the receiver..
    ///   - timeStyle: The time style of the receiver.
    ///   - calendar: The calendar for the receiver.
    ///   - timeZone: The time zone for the receiver.
    ///   - locale: The locale for the receiver.
    ///   - doesRelativeDateFormatting: A Boolean value that indicates
    ///     whether the receiver uses phrases such as “today” and “tomorrow”
    ///     for the date component.
    /// - Returns: A string.
     func string(dateStyle: DateFormatter.Style,
                 timeStyle: DateFormatter.Style = .none,
                 calendar: Calendar = Calendar.current,
                 timeZone: TimeZone = TimeZone.current,
                 locale: Locale = Locale.current,
                 doesRelativeDateFormatting: Bool = false) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        dateFormatter.doesRelativeDateFormatting = doesRelativeDateFormatting
        if calendar.isDate(start, inSameDayAs: end) {
            let startDate = dateFormatter.string(from: start)
            dateFormatter.dateStyle = .none
            let endDate = dateFormatter.string(from: end)
            return "\(startDate) - \(endDate)"
        } else {
            let startDate = dateFormatter.string(from: start)
            let endDate = dateFormatter.string(from: end)
            return "\(startDate) - \(endDate)"
        }
    }

    /// Returns a string from a date interval with a date format.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     let timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let dateFormat = "yyyy.MM.dd 'at' HH:mm:ss Z"
    ///     let string = dateInterval.string(dateFormat: dateFormat, calendar: calendar, timeZone: timeZone)
    ///     print(string)
    ///     // Prints "2001.01.01 at 00:00:00 +0000 - 2001.01.01 at 00:00:01 +0000"
    ///
    /// - Parameters:
    ///   - dateFormat: The date format string used by the receiver.
    ///   - calendar: The calendar for the receiver.
    ///   - timeZone: The time zone for the receiver.
    /// - Returns: A string.
    func string(dateFormat: String, calendar: Calendar = Calendar.current, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.calendar = calendar
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        let startDate = dateFormatter.string(from: start)
        let endDate = dateFormatter.string(from: end)
        return "\(startDate) - \(endDate)"
    }

}
