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
    
}
