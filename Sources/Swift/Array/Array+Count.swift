//
//  Array+Count.swift
//  SExtensions
//
//  Created by Ray on 2018/9/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    func countOfElement(_ element: Element) -> Int {
        return filter{ $0 == element }.count
    }
    
}

public extension Array where Element: Hashable {
    
    var countDictionary: [Element: Int] {
        var dictionary = [Element: Int]()
        for element in self {
            dictionary[element] = (dictionary[element] ?? 0) + 1
        }
        return dictionary
    }
    
}
