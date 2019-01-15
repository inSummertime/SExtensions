//
//  Double+RoundTo.swift
//  SExtensions
//
//  Created by Ray on 2018/7/6.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Double {

    /// Returns a rounded double with a specific decimal.
    ///
    ///     print(3.1415926.round(to: 2))
    ///     // Prints "3.14"
    ///
    /// - Parameter places: How many decimal.
    /// - Returns: A rounded double.
    func round(to places: Int) -> Double {
        guard places >= 0 else {
            return self
        }
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
