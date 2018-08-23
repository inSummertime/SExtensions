//
//  Array+Has.swift
//  SExtensions
//
//  Created by Ray on 2018/6/30.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array {
    
    /// Returns a Boolean value that indicates whether the array has a
    /// element that satisfy the given predicate
    ///
    ///     print(["hello", "world"].hasAny({ $0.count == 5 }))
    ///     // Prints "true"
    ///
    /// - Parameter isIncluded:  A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: `true` if the array has any element that `isIncluded` allows; otherwise, `false`.
    func hasAny(_ isIncluded: (_ element: Element) -> Bool) -> Bool {
        return self.filter(isIncluded).count > 0
    }
    
    /// Returns a Boolean value that indicates whether the array has all
    /// elements that satisfy the given predicate
    ///
    ///     print(["hello", "world"].hasAll({ $0.count == 5 }))
    ///     // Prints "true"
    ///
    /// - Parameter isIncluded:  A closure that takes a elemrnt as its
    /// argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: `true` if the array has all elements that `isIncluded` allows; otherwise, `false`.
    func hasAll(_ isIncluded: (_ element: Element) -> Bool) -> Bool {
        return self.filter(isIncluded).count == count
    }
    
}


