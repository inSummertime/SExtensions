//
//  Set+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/10/4.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Set {

    /// Returns a union set of two sets.
    ///
    ///     print(["hello", "world"] | ["!"])
    ///     // Prints "["hello", "world", "!"]"
    ///
    /// - Parameters:
    ///   - lhs: A set.
    ///   - rhs: The set to combile with `lhs`.
    /// - Returns: A set.
    static func | (lhs: Set, rhs: Set) -> Set {
        return lhs.union(rhs)
    }

    /// Subtracts the second value from the first if the elements are equal.
    ///
    ///     print(["hello", "world"] - ["world"])
    ///     // Prints "["hello"]"
    ///
    /// - Parameters:
    ///   - lhs: The first set.
    ///   - rhs: The set to subtract.
    /// - Returns: A set.
    static func - (lhs: Set, rhs: Set) -> Set {
        return lhs.subtracting(rhs)
    }

    /// Subtracts the second set from the first if the elements are equal and stores the
    /// difference in the left-hand-side variable.
    ///
    ///     var hello = ["hello", "world"]
    ///     hello -= ["world"]
    ///     print(hello)
    ///     // Prints "["hello"]"
    ///
    /// - Parameters:
    ///   - lhs: A set.
    ///   - rhs: The set to subtract from `lhs`.
    static func -= (lhs: inout Set, rhs: Set) {
        lhs = lhs.subtracting(rhs)
    }

    /// Returns a new set with the elements that are common to both ywo sets.
    ///
    ///     print(["hello"] & ["hello", "world"])
    ///     // Prints "["hello"]"
    ///
    /// - Parameters:
    ///   - lhs: A set.
    ///   - rhs: The set to compare with `lhs`.
    /// - Returns: A set.
    static func & (lhs: Set, rhs: Set) -> Set {
        return lhs.intersection(rhs)
    }
}
