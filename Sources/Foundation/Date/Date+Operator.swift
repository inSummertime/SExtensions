//
//  Date+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/7/26.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Returns the interval between the receiver and another given date.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let nextDay = date.addingTimeInterval(Date.timeIntervalPerDay)
    ///     print(nextDay - date)
    ///     // Prints "86400.0"
    ///
    /// - Parameters:
    ///   - lhs: A date.
    ///   - rhs: The date with which to compare the receiver.
    /// - Returns: The interval.
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSince(rhs)
    }
    
}
