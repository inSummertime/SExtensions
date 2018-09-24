//
//  Array+Duplicate.swift
//  SExtensions
//
//  Created by Ray on 2018/9/21.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element: Hashable {
    
    /// A set of duplicate elements.
    ///
    ///     print([0, 1, 2, 2, 3, 3].duplicates)
    ///     // Prints "[2, 3]"
    var duplicates: Set<Element> {
        let dictionary = Dictionary(grouping: self, by: { $0 })
        let duplicateDictionary = dictionary.filter { $1.count > 1 }
        return Set(duplicateDictionary.keys)
    }
    
    /// An array of duplidate elements with the original order.
    ///
    ///     print([0, 0, 1, 2, 2, 3, 0, 2].duplicateArray)
    ///     // Prints "[0, 0, 2, 2, 0, 2]"
    var duplicateArray: Array {
        let dictionary = Dictionary(grouping: self, by: { $0 })
        let uniqueDictionary = dictionary.filter { $1.count == 1 }
        let uniques = Array(uniqueDictionary.keys)
        return subtracting(uniques)
    }
    
}
