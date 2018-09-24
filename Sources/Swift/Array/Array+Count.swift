//
//  Array+Count.swift
//  SExtensions
//
//  Created by Ray on 2018/9/19.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element: Equatable {
    
    /// Returns the count of a element.
    ///
    ///     print([0, 0, 1, 2].countOfElement(0))
    ///     // Prints "2"
    ///
    /// - Parameter element: The element.
    /// - Returns: The count.
    func countOfElement(_ element: Element) -> Int {
        return filter{ $0 == element }.count
    }
    
}

public extension Array where Element: Hashable {
    
    /// A dictionary of all elements and their counts.
    ///
    ///     print([0, 0, 1, 2].countDictionary)
    ///     // Prints "[0: 2, 1: 1, 2: 1]"
    var countDictionary: [Element: Int] {
        var dictionary = [Element: Int]()
        for element in self {
            dictionary[element] = (dictionary[element] ?? 0) + 1
        }
        return dictionary
    }
    
}
