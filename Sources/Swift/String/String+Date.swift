//
//  String+Date.swift
//  SExtensions
//
//  Created by Ray on 2018/6/2.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {

    /// Returns a date from a string
    ///
    ///     let dateFromTime = "2018-06-02 00:00:00".toDate(dateFormat: "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone(identifier: "UTC")!)
    ///     let dateFromTime1 = "2018-06-02 00:00:01".toDate(dateFormat: "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone(identifier: "UTC")!)
    ///     print(dateFromTime!.timeIntervalSince(dateFromTime1!))
    ///     // Prints "-1"
    ///
    /// - Parameters:
    ///   - dateFormat: date format
    ///   - timeZone: time zone
    ///   - calendar: calendar
    ///   - locale: locale
    /// - Returns: a date
    func toDate(dateFormat: String, timeZone: TimeZone = TimeZone.current, calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian), locale: Locale = Locale.current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = timeZone
        dateFormatter.calendar = calendar
        dateFormatter.locale = locale
        return dateFormatter.date(from: self)
    }

}
