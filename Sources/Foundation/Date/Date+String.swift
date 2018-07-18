//
//  Date+String.swift
//  SExtensions
//
//  Created by Ray on 2018/7/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Returns a string from a date with a date style.
    ///
    ///     print(Date(timeIntervalSinceReferenceDate: 0).string(dateStyle: .medium, timeStyle: .short, calendar: Calendar(identifier: Calendar.Identifier.gregorian), timeZone: TimeZone(secondsFromGMT: 0)!, locale: Locale(identifier: "en")))
    ///     // Prints ""Jan 1, 2001 at 12:00 AM""
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
    func string(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style = .none, calendar: Calendar = Calendar.current, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current, doesRelativeDateFormatting: Bool = false) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        dateFormatter.calendar = calendar
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        dateFormatter.doesRelativeDateFormatting = doesRelativeDateFormatting
        return dateFormatter.string(from: self)
    }
    
    /// Returns a string from a date with a date format.
    ///
    ///     print(Date(timeIntervalSinceReferenceDate: 0).string(dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: Calendar(identifier: Calendar.Identifier.gregorian), timeZone: TimeZone(secondsFromGMT: 0)!))
    ///     // Prints "2001.01.01 at 00:00:00 +0000"
    ///
    /// - Parameters:
    ///   - dateFormat: The date format string used by the receiver.
    ///   - calendar: The calendar for the receiver.
    ///   - timeZone: The time zone for the receiver.
    /// - Returns: A string.
    func string(dateFormat: String, calendar: Calendar = Calendar.current, timeZone: TimeZone = TimeZone.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.calendar = calendar
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
    
}
