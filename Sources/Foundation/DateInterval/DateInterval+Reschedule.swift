//
//  DateInterval+Reschedule.swift
//  SExtensions
//
//  Created by Ray on 2018/8/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension DateInterval {

    /// Returns A `DateInterval` by moving this `DateInterval` to a new
    /// Date`.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
    ///     let nextDateInterval = dateInterval.moving(to: Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(60.0))
    ///     print(nextDateInterval.start == Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(60.0))
    ///     // Prints "true"
    ///     print(nextDateInterval.duration == 60.0)
    ///     // Prints "true"
    ///
    /// - Parameter date: A `Date`.
    /// - Returns: A `DateInterval`.
    func moving(to date: Date) -> DateInterval {
        return DateInterval(start: date, duration: duration)
    }

    /// Returns a new `DateInterval` by prolonging a `TimeInterval` to this
    /// `DateInterval`.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
    ///     let nextDateInterval = dateInterval.prolonging(timeInterval: 60.0)
    ///     print(nextDateInterval.duration == 120.0)
    ///     // Prints "true"
    ///
    /// - Parameter timeInterval: The value to prolong, in seconds.
    /// - Returns: A `DateInterval`.
    func prolonging(timeInterval: TimeInterval) -> DateInterval {
        let endDate = end.addingTimeInterval(timeInterval)
        return DateInterval(start: start, end: endDate)
    }

    /// Returns a new `DateInterval` by reducing a `TimeInterval` to this
    /// `DateInterval`.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
    ///     let nextDateInterval = dateInterval.endingEarly(timeInterval: 30.0)
    ///     print(nextDateInterval.duration == 30.0)
    ///     // Prints "true"
    ///
    /// - Parameter timeInterval: The value to reduce, in seconds.
    /// - Returns: A `DateInterval`.
    func endingEarly(timeInterval: TimeInterval) -> DateInterval {
        let endDate = end.addingTimeInterval(-timeInterval)
        return DateInterval(start: start, end: endDate)
    }

}
