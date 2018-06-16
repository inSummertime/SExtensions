//
//  Dictionary+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/6/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /// Returns a union dictionary of this dictionary and the given dictionary.
    ///
    ///     print(["hello": 0].union(["world": 1]))
    ///     // Prints "[0: 0, 1: 1]"
    ///
    /// - Parameters:
    ///   - other: Another dictionary.
    /// - Returns: A dictionary.
    func union(_ other: [Key: Value]) -> [Key: Value] {
        var result = self
        for (key, value) in other {
            result[key] = value
        }
        return result
    }
    
    /// Inserts the elements of the given dictionary into the dictionary.
    ///
    ///     var hello = ["hello": 0]
    ///     hello.fromUnion(["world": 1])
    ///     print(hello, ["hello": 1, "world": 1])
    ///     // Prints "true"
    ///
    /// - Parameter other: Another dictionary.
    mutating func fromUnion(_ other: [Key: Value]) {
        for (key, value) in other {
            self[key] = value
        }
    }
    
}

public extension Dictionary where Value: Equatable {
    
    /// Returns a new dictionary with the elements that are common to both this dictionary and the given dictionary.
    ///
    ///     print(["hello": 0].intersection(["hello": 0, "world": 1]))
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameter other: Another dictionary.
    /// - Returns: A new dictionary.
    func intersection(_ other:  [Key: Value]) -> [Key: Value] {
        var result = [Key: Value]()
        for (key, value) in other {
            if let v = self[key], v == value {
                result[key] = value
            }
        }
        return result
    }
    
    /// Returns a new dictionary containing the elements of this dictionary that do not occur in the given dictionary.
    ///
    ///     print(["hello": 0].intersection(["hello": 0, "world": 1]))
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameter other: Another dictionary.
    /// - Returns:  A new dictionary.
    func subtracting(_ other:  [Key: Value]) -> [Key: Value] {
        var result = self
        for (key, value) in other {
            if self[key] == value {
                result.removeValue(forKey: key)
            }
        }
        return result
    }
    
    /// Removes the elements of this dictionary that do not occur in the given dictionary.
    ///
    ///     var helloWorld = ["hello": 0, "world": 1]
    ///     helloWorld.subtract(["world": 1])
    ///     print(helloWorld)
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameter other: Another dictionary.
    mutating func subtract(_ other:  [Key: Value]) {
        for (key, value) in other {
            if self[key] == value {
                removeValue(forKey: key)
            }
        }
    }
    
    /// Returns a Boolean value that indicates whether this dictionary is a subdictionary of the given dictionary.
    ///
    ///     print(["hello": 0].isSubdictionary(of: ["hello": 0, "world": 1]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another dictionary.
    /// - Returns: `true` if the dictionary is a subdictionary of `other`; otherwise, `false`.
    func isSubdictionary(of other: [Key: Value]) -> Bool {
        if self.count == 0 {
            return false
        }
        if other.count == 0 {
            return false
        }
        for (key, value) in self {
            if let v = other[key] {
                if v != value {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    /// Returns a Boolean value that indicates whether the dictionary is a strict subdictionary of the given dictionary.
    ///
    ///     print(["hello": 0].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
    ///     // Prints "true"
    ///
    /// - Parameter other:  Another dictionary.
    /// - Returns: `true` if the dictionary is a strict subdictionary of `other`; otherwise, `false`.
    func isStrictSubdictionary(of other: [Key: Value]) -> Bool {
        if self == other {
            return false
        }
        return isSubdictionary(of: other)
    }
    
    /// Returns a Boolean value that indicates whether this dictionary contains the given dictionary.
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
