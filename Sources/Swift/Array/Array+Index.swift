//
//  Array+Index.swift
//  SExtensions
//
//  Created by Ray on 2018/7/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array where Element : Equatable {
    
    /// Returns the indexes where the specified value appears in the
    /// array.
    ///
    ///     print(["hello", "world", "!", "hello", "world", "!"].indexes(of: "hello"))
    ///     // Prints "[0, 3]"
    ///
    /// - Parameter element: An element to search for in the array.
    /// - Returns: The array of indexes where `element` is found. If `element`
    ///   is not found in the array, returns an empty array.
    func indexes(of element: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0..<count {
            if self[index] == element {
                indexes.append(index)
            }
        }
        return indexes
    }
    
    /// Returns the indexes where `element` satisfies the given predicate.
    ///
    ///     print(["hello", "world", "!", "hello", "world", "!"].indexes( {$0.count == 5} ))
    ///     // Print "[0, 1, 3, 4]"
    ///
    /// - Parameter isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: The array of indexes where `element` satisfies the given
    ///   predicate. If `element` is not found in the array, returns an empty
    ///   array.
    func indexes(_ isIncluded: (_ element: Element) -> Bool) -> [Int] {
        var indexes = [Int]()
        for index in 0..<count {
            if isIncluded(self[index]) {
                indexes.append(index)
            }
        }
        return indexes
    }
    
}
