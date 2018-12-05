//
//  DateInterval+Contains.swift
//  SExtensions
//
//  Created by Ray on 2018/8/10.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension DateInterval {

    /// Returns `true` if `self` contains another `dateInterval`.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2.0)
    ///     print(dateInterval.contains(DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1.0)))
    ///     // Prints "true"
    ///
    /// - Parameter dateInterval: A `dateInterval`.
    /// - Returns: Returns `true` if `self` contains another
    ///   `dateInterval`.
    func contains(_ dateInterval: DateInterval) -> Bool {
        return dateInterval.start >= start && dateInterval.end <= end
    }

}
