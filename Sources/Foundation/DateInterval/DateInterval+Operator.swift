//
//  DateInterval+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/8/5.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension DateInterval {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
    ///     let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
    ///     print(nextDateInterval > dateInterval)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a Boolean value.
    static func > (lhs: DateInterval, rhs: DateInterval) -> Bool {
        return rhs < lhs
    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument, or whether two
    /// values are equal.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
    ///     let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
    ///     print(dateInterval <= nextDateInterval)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a Boolean value.
    static func <= (lhs: DateInterval, rhs: DateInterval) -> Bool {
        return lhs == rhs || lhs < rhs
    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument, or whether two
    /// values are equal.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
    ///     let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
    ///     print(nextDateInterval >= dateInterval)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a Boolean value.
    static func >= (lhs: DateInterval, rhs: DateInterval) -> Bool {
        return lhs == rhs || rhs < lhs
    }

    /// Returns a DateInterval that represents the interval where the given
    /// date interval and the current instance intersect. In the event that
    /// there is no intersection, the method returns nil.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
    ///     let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
    ///     print(dateInterval & nextDateInterval == dateInterval)
    ///     // Print "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a DateInterval, or nil.
    static func & (lhs: DateInterval, rhs: DateInterval) -> DateInterval? {
        return lhs.intersection(with: rhs)
    }

    /// Returns a DateInterval that represents the interval where the given
    /// date interval and the current instance combile. In the event that
    /// there is no intersection, the method returns nil.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
    ///     let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
    ///     print(dateInterval | nextDateInterval == nextDateInterval)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: a DateInterval, or nil.
    static func | (lhs: DateInterval, rhs: DateInterval) -> DateInterval? {
        if lhs.intersection(with: rhs) == nil {
            return nil
        }
        if rhs >= lhs {
            return DateInterval(start: lhs.start, end: rhs.end)
        } else {
            return DateInterval(start: rhs.start, end: lhs.end)
        }
    }
}
