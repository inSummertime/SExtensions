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
    func string(dateFormat: String, calendar: Calendar = Calendar.current, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.calendar = calendar
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }

    /// Month styles.
    ///
    /// - full: Full name of month.
    /// - threeLetters: Three letter month abbreviation.
    /// - oneLetter: One letter month abbreviation.
    /// - twoDigits: A month with at least 2 digits.
    /// - oneDigit: A month with at least 1 digit.
    enum MonthStyle: String {
        case full = "MMMM"
        case threeLetterAbbreviation = "MMM"
        case oneLetterAbbreviation = "MMMMM"
        case twoDigits = "MM"
        case oneDigit = "M"
    }

    /// Returns a month string from a date with a month date format
    /// style.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     let timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let locale = Locale(identifier: "en")
    ///     print(date.month(style: .full, calendar: calendar, timeZone: timeZone, locale: locale))
    ///     // Prints "January"
    ///
    /// - Parameters:
    ///   - style: A MonthDateFormatStyle.
    ///   - calendar: The calendar for the receiver.
    ///   - timeZone: The time zone for the receiver.
    ///   - locale: The locale for the receiver.
    /// - Returns: A month string.
    func month(style: MonthStyle, calendar: Calendar = Calendar.current, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> String {
        return string(dateFormat: style.rawValue, calendar: calendar, timeZone: timeZone, locale: locale)
    }

    /// Day name styles.
    ///
    /// - full: Full day name.
    /// - threeLetters: 3 letter day abbreviation of day name.
    /// - twoLetters: 2 letter day abbreviation of day name.
    /// - oneLetter: 1 letter day abbreviation of day name.
    enum DayNameStyle: String {
        case full = "EEEE"
        case threeLetterAbbreviation = "EEE"
        case twoLetterAbbreviation = "EEEEEE"
        case oneLetterAbbreviation = "EEEEE"
    }

    /// Returns a day name string from a date with a day name date
    /// format style.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     let timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let locale = Locale(identifier: "en")
    ///     print(date.dayName(style: .full, calendar: calendar, timeZone: timeZone, locale: locale))
    ///     // Prints "Monday"
    ///
    /// - Parameters:
    ///   - style: A DayNameDateFormatStyle.
    ///   - calendar: The calendar for the receiver.
    ///   - timeZone: The time zone for the receiver.
    ///   - locale: The locale for the receiver.
    /// - Returns: A day name string.
    func dayName(style: DayNameStyle, calendar: Calendar = Calendar.current, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> String {
        return string(dateFormat: style.rawValue, calendar: calendar, timeZone: timeZone, locale: locale)
    }

}
