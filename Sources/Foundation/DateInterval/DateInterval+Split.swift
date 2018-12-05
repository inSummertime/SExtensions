//
//  DateInterval+Split.swift
//  SExtensions
//
//  Created by Ray on 2018/8/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension DateInterval {

    /// Splits into sub date intervals with a duration, max split count, and
    /// a bool indicating whether omits a date interval whose duration is
    /// insufficient
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
    ///     let dateIntervals = dateInterval.split(with: 7.0)
    ///     print(dateIntervals.count == 8)
    ///     // Prints "true"
    ///     print(dateIntervals[7] == DateInterval(start: Date(timeIntervalSinceReferenceDate: 49.0), duration: 7.0))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - duraion: A time interval for the sub date intervals.
    ///   - maxSplits: The max count of the results.
    ///   - omittingInsufficientDateInterval: A bool indicating whether omits
    ///     a date interval whose duration is insufficient.
    /// - Returns: A array of date intervals.
    func split(with duraion: TimeInterval, maxSplits: Int? = nil, omittingInsufficientDateInterval: Bool = true) -> [DateInterval] {
        if duraion > self.duration {
            return []
        } else if duraion == self.duration {
            return [self]
        } else {
            let offset = duraion > 0 ? duraion : 1.0
            var startDate = start
            var dateIntervals = [DateInterval]()
            if omittingInsufficientDateInterval {
                while startDate.addingTimeInterval(offset) <= end {
                    let dateInterval = DateInterval(start: startDate, duration: duraion)
                    if let maxSplits = maxSplits {
                        if maxSplits > dateIntervals.count {
                            dateIntervals.append(dateInterval)
                        } else {
                            break
                        }
                    } else {
                        dateIntervals.append(dateInterval)
                    }
                    startDate = startDate.addingTimeInterval(offset)
                }
            } else {
                while startDate <= end {
                    let realDuration = DateInterval(start: startDate, duration: duraion).end > end ? end - startDate : duration
                    let dateInterval = DateInterval(start: startDate, duration: realDuration)
                    if let maxSplits = maxSplits {
                        if maxSplits > dateIntervals.count {
                            dateIntervals.append(dateInterval)
                        } else {
                            break
                        }
                    } else {
                        dateIntervals.append(dateInterval)
                    }
                    startDate = startDate.addingTimeInterval(offset)
                }
            }
            return dateIntervals
        }
    }

}
