//
//  Array+SafeSubscript.swift
//  SExtensions
//
//  Created by Ray on 2018/6/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array {
    
    /// Returns the element if it is within bounds.
    ///
    ///     print(["hello", "world"][safe: 1]!)
    ///     // Prints "world"
    ///
    /// - Parameter index: the specified index.
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// Returns an array if the indices are within bounds.
    ///
    ///     print(["hello"][safeIndices: 0, 1])
    ///     // Prints "["hello"]"
    ///
    /// - Parameter indices: the indices the elements are at.
    subscript(safeIndices indices: Int...) -> Array {
        var result = Array()
        for index in indices {
            if self.indices.contains(index) {
                result.append(self[index])
            }
        }
        return result
    }
    
    /// Returns a subsequence with a CountableRange safely.
    ///
    ///     print(["hello", "world", "!"][safe: 1..<4])
    ///     // Prints "Optional(["world", "!"])"
    ///
    /// - Parameter range: a CountableRange.
    /// - Returns: A subsequence starting at the `start` position of the
    ///   CountableRange or self and ending at the `end` position of the
    ///   CountableRange or self
    subscript(safe range: CountableRange<Int>) -> Array? {
        if range.lowerBound >= count {
            return nil
        }
        if range.upperBound < 0 {
            return nil
        }
        let lower = Swift.max(0, range.lowerBound)
        let upper = Swift.min(count, range.upperBound)
        return Array(self[lower..<upper])
    }
    
    /// Returns a subsequence with a CountableClosedRange safely.
    ///
    ///     print(["hello", "world", "!"][safe: -1...1])
    ///     // Prints "Optional(["hello", "world"])"
    ///
    /// - Parameter range: a CountableClosedRange
    /// - Returns: A subsequence starting at the `start` position of the
    ///   CountableClosedRange or self and ending at the `end` position of the
    ///   CountableClosedRange or self
    subscript(safe range: CountableClosedRange<Int>) -> Array? {
        if range.lowerBound >= count {
            return nil
        }
        if range.upperBound < 0 {
            return nil
        }
        let lower = Swift.max(0, range.lowerBound)
        let upper = Swift.min(count - 1, range.upperBound)
        return Array(self[lower...upper])
    }
    
}
