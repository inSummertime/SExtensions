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

    /// Returns true if the left hand `Date` is earlier in time than the
    /// right hand `Date` or the two `Date` values represent the same point
    /// in time.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let next = date.addingTimeInterval(1)
    ///     print(date <= next)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a Boolean value.
    static func <= (lhs: Date, rhs: Date) -> Bool {
        return lhs == rhs || lhs < rhs
    }

    /// Returns true if the left hand `Date` is later in time than the right
    /// hand `Date` or the two `Date` values represent the same point in
    /// time.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     let next = date.addingTimeInterval(1)
    ///     print(next >= date)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a Boolean value.
    static func >= (lhs: Date, rhs: Date) -> Bool {
        return lhs == rhs || lhs > rhs
    }

}
