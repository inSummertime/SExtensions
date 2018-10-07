//
//  Set+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/10/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Set {
    
    /// Returns a new set with the elements that are different from the given
    /// sets.
    ///
    ///     let set: Set = ["hello", "world"]
    ///     print(set.difference(["hello"], ["!"]))
    ///     // Prints "["!", "world"]"
    ///
    /// - Parameter others: Other sets.
    /// - Returns: A new set.
    func difference(_ others: Set...) -> Set {
        var result = self
        for set in others {
            for element in set {
                if result.contains(element) {
                    result = result.filter({ $0 != element })
                } else {
                    result.insert(element)
                }
            }
        }
        return result
    }
    
    /// Returns a Boolean value that indicates whether this set contains
    /// the given set.
    ///
    ///     print(["hello", "world"].contains(["hello"]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another set.
    /// - Returns: `true` if the set contains `other`; otherwise, `false`.
    func contains(_ other: Set) -> Bool {
        return other.isSubset(of: self)
    }
    
}
