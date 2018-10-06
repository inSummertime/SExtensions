//
//  Set+Has.swift
//  SExtensions
//
//  Created by Ray on 2018/10/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Set {
    
    /// Returns a Boolean value that indicates whether the set has a
    /// element that satisfy the given predicate.
    ///
    ///     let set: Set = ["hello", "world"]
    ///     print(set.hasAny({ $0.count == 5 }))
    ///     // Prints "true"
    ///
    /// - Parameter isIncluded:  A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: `true` if the array has any element that `isIncluded` allows; otherwise, `false`.
    func hasAny(_ isIncluded: (_ element: Element) -> Bool) -> Bool {
        return filter(isIncluded).count > 0
    }
    
    /// Returns a Boolean value that indicates whether all elements in the set
    /// satisfy the given predicate.
    ///
    ///     let set: Set = ["hello", "world"]
    ///     print(set.hasAll({ $0.count == 5 }))
    ///     // Prints "true"
    ///
    /// - Parameter isIncluded:  A closure that takes a element as its
    /// argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: `true` if all elements satisfy `isIncluded`; otherwise, `false`.
    func hasAll(_ isIncluded: (_ element: Element) -> Bool) -> Bool {
        return filter(isIncluded).count == count
    }
    
}
