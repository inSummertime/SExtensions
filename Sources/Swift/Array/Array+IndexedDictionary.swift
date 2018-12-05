//
//  Array+IndexedDictionary.swift
//  SExtensions
//
//  Created by Ray on 2018/10/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array {

    /// Returns a dictionary with the index as the key, elmenent as the vlaue.
    ///
    ///     let dictionary: [Int: Any] = ["hello", "world", "!", 0].indexedDictionary
    ///     print(dictionary[0])
    ///     // Prints "Optional("hello")"
    var indexedDictionary: [Int: Element] {
        return enumerated().reduce(into: [:]) { $0[$1.offset] = $1.element }
    }

}
