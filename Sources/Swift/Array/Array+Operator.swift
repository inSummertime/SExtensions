//
//  Array+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/6/28.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element: Equatable {

    /// Returns a union array of two arrays.
    ///
    ///     print(["hello", "world"] | ["!"])
    ///     // Prints "["hello", "world", "!"]"
    ///
    /// - Parameters:
    ///   - lhs: An array.
    ///   - rhs: The array to combile with `lhs`.
    /// - Returns: An array.
    static func | (lhs: Array, rhs: Array) -> Array {
        return lhs.union(rhs)
    }

    /// Subtracts the second value from the first if the elements are equal.
    ///
    ///     print(["hello", "world"] - ["world"])
    ///     // Prints "["hello"]"
    ///
    /// - Parameters:
    ///   - lhs: The first array.
    ///   - rhs: The array to subtract.
    /// - Returns: An array.
    static func - (lhs: Array, rhs: Array) -> Array {
        return lhs.subtracting(rhs)
    }

    /// Subtracts the second array from the first if the elements are equal and
    /// stores the difference in the left-hand-side variable.
    ///
    ///     var hello = ["hello", "world"]
    ///     hello -= ["world"]
    ///     print(hello)
    ///     // Prints "["hello"]"
    ///
    /// - Parameters:
    ///   - lhs: An array.
    ///   - rhs: The array to subtract from `lhs`.
    static func -= (lhs: inout Array, rhs: Array) {
        lhs = lhs.subtracting(rhs)
    }

    /// Returns a new array with the elements that are common to both ywo
    /// arrays.
    ///
    ///     print(["hello"] & ["hello", "world"])
    ///     // Prints "["hello"]"
    ///
    /// - Parameters:
    ///   - lhs: An array.
    ///   - rhs: The array to compare with `lhs`.
    /// - Returns: An array.
    static func & (lhs: Array, rhs: Array) -> Array {
        return lhs.intersection(rhs)
    }

}
