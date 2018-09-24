//
//  Array+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/6/27.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element : Equatable {
    
    /// Returns a new array with the elements of both this array and the given
    /// arrays.
    ///
    ///     print(["hello", "world"].union(["!"], ["hello"])
    ///     // Prints "["hello", "world", "!"]"
    ///
    /// - Parameter others: Other arrays.
    /// - Returns: A new array with the unique elements of this array and
    ///   `others`.
    func union(_ others: Array...) -> Array {
        var result = self
        for array in others {
            for element in array {
                if !result.contains(element) {
                    result.append(element)
                }
            }
        }
        return result
    }
    
    /// Returns a new array with the elements that are common to both this array
    /// and the given arrays.
    ///
    ///     print(["hello", "world"].intersection(["hello"])
    ///     // Prints "["hello"]"
    ///
    /// - Parameter others: Other arrays
    /// - Returns: A new array.
    func intersection(_ others: Array...) -> Array {
        var temp = self
        var result = Array()
        for (index, array) in others.enumerated() {
            if index > 0 {
                temp = result
                result.removeAll()
            }
            for element in array {
                if temp.contains(element) {
                    result.append(element)
                }
            }
        }
        return result
    }
    
    /// Returns a new array with the elements that are different from the given
    /// arrays.
    ///
    /// - Parameter others: Other arrays.
    /// - Returns: A new array.
    func difference(_ others: Array...) -> Array {
        var result = self
        for array in others {
            for element in array {
                if result.contains(element) {
                    result = result.filter({ $0 != element })
                } else {
                    result.append(element)
                }
            }
        }
        return result
    }
    
    /// Returns a new array containing the elements of this array that do not
    /// occur in the given arrays.
    ///
    ///     print(["hello", "world", "!"].subtracting(["hello"]))
    ///     // Prints "["world", "!"]"
    ///
    /// - Parameter others: Other array
    /// - Returns: a new array
    func subtracting(_ others: Array...) -> Array {
        var result = self
        for array in others {
            for element in array {
                if self.contains(element)  {
                    result = result.filter({ $0 != element })
                }
            }
        }
        return result
    }
    
    /// Returns a Boolean value that indicates whether this array is a subarray
    /// of the given array.
    ///
    ///     print(["hello"].isSubarray(of: ["hello", "world"]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another array.
    /// - Returns: `true` if the array is a subarray of `other`; otherwise,
    ///   `false`.
    func isSubarray(of other: Array) -> Bool {
        if isEmpty || other.isEmpty {
            return false
        }
        for element in self {
            if !other.contains(element) {
                return false
            }
        }
        return true
    }
    
    /// Returns a Boolean value that indicates whether the array is a strict
    /// subarray of the given array.
    ///
    ///     print(["hello"].isStrictSubarray(of: ["hello"]))
    ///     // Prints "false"
    ///
    /// - Parameter other:  Another array.
    /// - Returns: `true` if the array is a strict subarray of `other`;
    ///   otherwise, `false`.
    func isStrictSubarray(of other: Array) -> Bool {
        if self == other {
            return false
        }
        return self.isSubarray(of: other)
    }
    
    /// Returns a Boolean value that indicates whether this array contains
    /// the given array.
    ///
    ///     print(["hello", "world"].contains(["hello"]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another array.
    /// - Returns: `true` if the array contains `other`; otherwise, `false`.
    func contains(_ other: Array) -> Bool {
        return other.isSubarray(of: self)
    }
    
}
