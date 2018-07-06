//
//  Double+RoundTo.swift
//  SExtensions
//
//  Created by Ray on 2018/7/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Returns a rounded double with a specific decimal.
    ///
    /// - Parameter places: How many decimal.
    /// - Returns: A rounded double.
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
