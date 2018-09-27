//
//  Array+Split.swift
//  SExtensions
//
//  Created by Ray on 2018/9/28.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array {
    
    /// Splits into an array of arrays of elements by a given size.
    ///
    ///     print([0, 1, 2, 3, 4, 5, 6, 7].spliting(by: 3))
    ///     // Prints "[[0, 1, 2], [3, 4, 5], [6, 7]]"
    ///
    /// - Parameter size: The size of each array.
    /// - Returns: An array.
    func spliting(by size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }

}
