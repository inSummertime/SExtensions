//
//  Dictionary+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/6/15.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    /// Adds two dictionaries.
    ///
    /// - Parameters:
    ///   - lhs: The first dictionary to add.
    ///   - rhs: The second dictionary to add.
    /// - Returns: a dictionary.
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        for (key, value) in rhs {
            result[key] = value
        }
        return result
    }
    
    /// Adds two dictionariesAdds and stores the result in the left-hand-side variable.
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

public extension Dictionary where Key: Hashable, Value: Equatable {
    
    /// Subtracts the second value from the first.
    ///
    /// - Parameters:
    ///   - lhs: The first dictionary.
    ///   - rhs: The dictionary to subtract.
    /// - Returns: a dictionary.
    static func - (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        for (key, value) in rhs {
            if lhs[key] == value {
                result.removeValue(forKey: key)
            }
        }
        return result
    }
    
    /// Subtracts the second dictionary from the first and stores the difference in
    /// the left-hand-side variable.
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
