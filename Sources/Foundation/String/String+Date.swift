//
//  String+Date.swift
//  SExtensions
//
//  Created by Ray on 2018/6/2.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// Returns a date from a string
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
