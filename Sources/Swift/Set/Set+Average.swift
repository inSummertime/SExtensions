//
//  Set+Average.swift
//  SExtensions
//
//  Created by Ray on 2018/10/5.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Set where Element: Numeric {

    /// Returns the sum of all elements.
    var total: Element { return reduce(0, +) }
}

public extension Set where Element: BinaryInteger {

    /// Returns the average of all elements.
    var average: Double {
        return isEmpty ? 0 : Double(total) / Double(count)
    }

}

extension Set where Element: BinaryFloatingPoint {

    /// Returns the average of all elements.
    var average: Element {
        return isEmpty ? 0 : total / Element(count)
    }

}
