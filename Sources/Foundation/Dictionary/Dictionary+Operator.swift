//
//  Dictionary+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/6/15.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    /// Combiles two dictionaries.
    ///
    ///     print([0: 0] + [1: 1])
    ///     // Prints "[0: 0, 1: 1]"
    ///
    /// - Parameters:
    ///   - lhs: The first dictionary to add.
    ///   - rhs: The second dictionary to add.
    /// - Returns: A dictionary.
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        for (key, value) in rhs {
            result[key] = value
        }
        return result
    }
    
    /// Combiles two dictionaries and stores the result in the left-hand-side variable.
    ///
    ///     var hello = ["hello": 0]
    ///     hello += ["world": 1]
    ///     print(hello)
    ///     // Prints "["hello": 0, "world": 1]"
    ///
    /// - Parameters:
    ///   - lhs: The first dictionary to add.
    ///   - rhs: The second dictionary to add.
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        for (key, value) in rhs {
            lhs[key] = value
        }
    }
    
}

public extension Dictionary where Value: Equatable {
    
    /// Subtracts the second value from the first if the key and the value are equal.
    ///
    ///     print(["hello": 0, "world": 1] - ["world": 1])
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameters:
    ///   - lhs: The first dictionary.
    ///   - rhs: The dictionary to subtract.
    /// - Returns: A dictionary.
    static func - (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        for (key, value) in rhs {
            if lhs[key] == value {
                result.removeValue(forKey: key)
            }
        }
        return result
    }
    
    /// Subtracts the second dictionary from the first if the key and the value are equal and stores the difference in the left-hand-side variable.
    ///
    ///     var hello = ["hello": 0, "world": 1]
    ///     hello -= ["world": 1]
    ///     print(hello)
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameters:
    ///   - lhs: A dictionary.
    ///   - rhs: The dictionary to subtract from `lhs`.
    static func -= (lhs: inout [Key: Value], rhs: [Key: Value]) {
        for (key, value) in rhs {
            if lhs[key] == value {
                lhs.removeValue(forKey: key)
            }
        }
    }
    
}
