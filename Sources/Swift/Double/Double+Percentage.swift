//
//  Double+Percentage.swift
//  SExtensions
//
//  Created by Ray on 2018/7/8.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Double {

    /// Returns a optional percentage string
    ///
    ///     print(0.55555.percentage(maximumFractionDigits: 1))
    ///     // Prints "Optional("55.6%")"
    ///
    /// - Parameter maximumFractionDigits: The maximum number of digits after
    ///   the decimal separator.
    /// - Returns: a optional percentage string
    func percentage(maximumFractionDigits: Int = 0) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = maximumFractionDigits
        return formatter.string(from: NSNumber(value: self))
    }
}
