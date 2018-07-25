//
//  Date+Count.swift
//  SExtensions
//
//  Created by Ray on 2018/7/25.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Returns day count this month.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(Date.timeIntervalPerWeek * 5)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     print(date.dayCountThisMonth(in: calendar))
    ///     // Prints "28"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: Day count.
    func dayCountThisMonth(in calendar: Calendar = Calendar.current) -> Int {
        let range = calendar.range(of: .day, in: .month, for: self)!
        return range.upperBound - range.lowerBound
    }
    
    /// Returns day count this year.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///      print(date.dayCountThisYear(in: calendar))
    ///     // Prints "365"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: Day count.
    func dayCountThisYear(in calendar: Calendar = Calendar.current) -> Int {
        let range = calendar.range(of: .day, in: .year, for: self)!
        return range.upperBound - range.lowerBound
    }
    
    /// Returns week count this month.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     print(date.weekCountThisMonth(in: calendar))
    ///     // Prints "5"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: Week count.
    func weekCountThisMonth(in calendar: Calendar = Calendar.current) -> Int {
        let range = calendar.range(of: .weekOfMonth, in: .month, for: self)!
        return range.upperBound - range.lowerBound
    }
    
    /// Returns week count this year.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     print(date.weekCountThisYear(in: calendar))
    ///     // Prints "53"
    ///
    /// - Parameter calendar: A calendar.
    /// - Returns: Week count.
    func weekCountThisYear(in calendar: Calendar = Calendar.current) -> Int {
        let range = calendar.range(of: .weekOfYear, in: .year, for: self)!
        return range.upperBound - range.lowerBound
    }
    
}
