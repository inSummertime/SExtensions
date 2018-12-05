//
//  Array+Append.swift
//  SExtensions
//
//  Created by Ray on 2018/9/19.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element: Equatable {

    /// Appends the element if array does not contain the element.
    ///
    ///     var array = [0, 1]
    ///     print(array.appendIfNotContains(2))
    ///     // Prints "true"
    ///     print(array)
    ///     // Prints "[0, 1, 2]"
    ///
    /// - Parameter newElement: The element that needs to append.
    /// - Returns: Whether appended.
    @discardableResult
    mutating func appendIfNotContains(_ newElement: Element) -> Bool {
        if contains(newElement) {
            return false
        } else {
            append(newElement)
            return true
        }
    }

    /// Appends the element if array does not contain enough.
    ///
    ///     var array = ["hello", "world", "!"]
    ///     print(array.append("hello", maxCountOfElement: 1))
    ///     // Prints "false"
    ///     print(array)
    ///     // Prints "["hello", "world", "!"]"
    ///     print(array.append("!", maxCountOfElement: 2))
    ///     // Prints "true"
    ///     print(array)
    ///     // Prints "["hello", "world", "!", "!"]"
    ///
    /// - Parameters:
    ///   - newElement: The element that needs to append.
    ///   - maxCountOfElement: The max capicity of the element.
    /// - Returns: Whether appended.
    @discardableResult
    mutating func append(_ newElement: Element, maxCountOfElement: Int) -> Bool {
        let countOfElment = filter { $0 == newElement }.count
        if countOfElment >= maxCountOfElement {
            return false
        } else {
            append(newElement)
            return true
        }
    }

}
