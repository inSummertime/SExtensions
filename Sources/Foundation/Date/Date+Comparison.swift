//
//  Date+Comparison.swift
//  SExtensions
//
//  Created by Ray on 2018/7/31.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Returns the earlist date in a date array.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let previous = date.addingTimeInterval(-1.0)
    ///     let next = date.addingTimeInterval(1.0)
    ///     print(Date.earliest(in: [previous, date, next])! == previous)
    ///     // Prints "true"
    ///
    /// - Parameter dates: A date array.
    /// - Returns: The earlist date.
    static func earliest(in dates: [Date]) -> Date? {
        if dates.count <= 1 {
            return dates.first
        }
        return dates.min(by: {
            $0 < $1
        })
    }
    
    /// Returns the latest date in a date array.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let previous = date.addingTimeInterval(-1.0)
    ///     let next = date.addingTimeInterval(1.0)
    ///     print(Date.latest(in: [previous, date, next])! == next)
    ///     // Prints "true"
    ///
    /// - Parameter dates: A date array.
    /// - Returns: The latest date.
    static func latest(in dates: [Date]) -> Date? {
        if dates.count <= 1 {
            return dates.first
        }
        return dates.min(by: {
            $0 > $1
        })
    }
    
}
