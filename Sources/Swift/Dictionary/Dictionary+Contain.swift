//
//  Dictionary+Contain.swift
//  SExtensions
//
//  Created by Ray on 2018/9/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Dictionary where Value: Equatable {

    /// Returns a Boolean value that indicates whether this dictionary contains
    /// the given value.
    ///
    /// - Parameter value: A Value.
    /// - Returns: `true` if the dictionary contains `value`; otherwise, `false`.
    func contains(value: Value) -> Bool {
        return contains { $0.1 == value }
    }

    /// Returns a Boolean value that indicates whether this dictionary contains
    /// the given dictionary.
    ///
    ///     print(["hello": 0, "world": 1].contains(other: ["hello": 0]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another dictionary.
    /// - Returns: `true` if the dictionary contains `other`; otherwise, `false`.
    func contains(other: [Key: Value]) -> Bool {
        return other.isSubdictionary(of: self)
    }

}
