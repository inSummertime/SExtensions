//
//  Array+Average.swift
//  SExtensions
//
//  Created by Ray on 2018/9/24.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element: Numeric {

    /// Returns the sum of all elements.
    var total: Element { return reduce(0, +) }
}

public extension Array where Element: BinaryInteger {

    /// Returns the average of all elements.
    var average: Double {
        return isEmpty ? 0 : Double(total) / Double(count)
    }

}

public extension Array where Element: BinaryFloatingPoint {

    /// Returns the average of all elements.
    var average: Element {
        return isEmpty ? 0 : total / Element(count)
    }

}
