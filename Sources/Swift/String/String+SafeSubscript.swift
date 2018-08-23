//
//  String+SafeSubscript.swift
//  SExtensions
//
//  Created by Ray on 2018/6/1.
//  Copyright © 2018年 Ray. All rights reserved.
//

public extension String {
    
    /// Accesses the character at the given position safely.
    ///
    ///     print("Hello world!"[safe: 0]!)
    ///     Prints "H"
    ///
    /// - Parameter i: position
    subscript(safe i: Int) -> Character? {
        if i >= 0 && i < count {
            return self[index(startIndex, offsetBy: i)]
        } else {
            return nil
        }
    }
    
    /// Returns a string with a contiguous countable range of the collection's
    /// elements safely.
    ///
    ///     print("Hello world!"[safe: 1..<7])
    ///     // Prints "ello w"
    ///
    /// - Parameter range: a countable range
    subscript(safe range: CountableRange<Int>) -> String? {
        if range.lowerBound >= count {
            return nil
        }
        if range.upperBound < 0 {
            return nil
        }
        let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) ?? startIndex
        let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) ?? endIndex
        return String(self[lowerIndex..<upperIndex])
    }
    
    /// Returns a string with a contiguous countable closed range of the
    /// collection's elements safely.
    ///
    ///     print("Hello world!"[safe: 1...7])
    ///     // Prints "ello wo"
    ///
    /// - Parameter range: a countable closed range
    subscript(safe range: CountableClosedRange<Int>) -> String? {
        if range.lowerBound >= count {
            return nil
        }
        if range.upperBound < 0 {
            return nil
        }
        if range.upperBound == 0 {
            if let first = first {
                return String(first)
            } else {
                return nil
            }
        }
        let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) ?? startIndex
        let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) ?? endIndex
        return String(self[lowerIndex..<upperIndex])
    }
    
    /// Returns a string with a contiguous countable partial from range of the
    /// collection's elements safely.
    ///
    ///     print("Hello world!"[safe: 0...])
    ///     // Prints "Hello world!"
    ///
    /// - Parameter range: a countable partial from range
    subscript(safe range: CountablePartialRangeFrom<Int>) -> String? {
        if range.lowerBound >= count {
            return nil
        }
        guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else {
            return nil
        }
        return String(self[lowerIndex..<endIndex])
    }
    
    /// Returns a string from index safely.
    ///
    ///     print("Hello world!"[safeFrom: 1])
    ///     // Prints "ello world!"
    ///
    /// - Parameter index: index
    subscript(safeFrom index: Int) -> String? {
        if index >= count {
            return nil
        }
        let fromIndex = self.index(startIndex, offsetBy: max(index, 0))
        return String(self[fromIndex..<endIndex])
    }
    
    /// Returns a string to index safely.
    ///
    ///     print("Hello world!"[safeTo: 1])
    ///     // Prints "He"
    ///
    /// - Parameter index: index
    subscript(safeTo index: Int) -> String? {
        if index < 0 {
            return nil
        }
        if count == 0 {
            return nil
        }
        let toIndex = self.index(startIndex, offsetBy: min(index, count - 1))
        return String(self[startIndex...toIndex])
    }
    
}
