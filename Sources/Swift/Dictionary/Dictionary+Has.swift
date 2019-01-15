//
//  Dictionary+Has.swift
//  SExtensions
//
//  Created by Ray on 2018/6/24.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Dictionary {

    /// Returns a Boolean value that indicates whether the dictionary has
    /// a key
    ///
    ///     print(["hello": 0].hasKey("hello"))
    ///     // Prints "true"
    ///
    /// - Parameter key: A key
    /// - Returns: `true` if the dictionary has the key; otherwise, `false`.
    func hasKey(_ key: Key) -> Bool {
        return self[key] != nil
    }

    /// Returns a Boolean value that indicates whether the dictionary has
    /// a element that satisfy the given predicate
    ///
    ///     print(["hello": 0, "world": 1].hasAny({ $0.1 == 0 }))
    ///     // Prints "true"
    ///
    /// - Parameter isIncluded:  A closure that takes a key-value pair as its
    ///   argument and returns a Boolean value indicating whether the pair
    ///   should be included.
    /// - Returns: `true` if the dictionary has any element that `isIncluded` allows; otherwise, `false`.
    func hasAny(_ isIncluded: (_ element: Element) -> Bool) -> Bool {
        return self.filter(isIncluded).count > 0
    }

    /// Returns a Boolean value that indicates whether the dictionary has
    /// all elements that satisfy the given predicate
    ///
    ///     print(["hello": 0, "world": 1].hasAll({ $0.0.count == 5 }))
    ///     // Prints "true"
    ///
    /// - Parameter isIncluded:  A closure that takes a key-value pair as its
    ///   argument and returns a Boolean value indicating whether the pair
    ///   should be included.
    /// - Returns: `true` if the dictionary has all elements that `isIncluded` allows; otherwise, `false`.
    func hasAll(_ isIncluded: (_ element: Element) -> Bool) -> Bool {
        return self.filter(isIncluded).count == count
    }
}

public extension Dictionary where Value: Equatable {

    /// Returns a Boolean value that indicates whether the dictionary has
    /// a key and a value
    ///
    ///     print(["hello": 0].has(key: "hello", value: 0))
    ///     // Prints "true"
    ///
    /// - Parameter key: A key
    /// - Parameter value: A value
    /// - Returns: `true` if the dictionary has the key and value; otherwise, `false`.
    func has(key: Key, value: Value) -> Bool {
        return self[key] == value
    }

    /// Returns a Boolean value that indicates whether the dictionary has
    /// a key-value pair
    ///
    ///     print(["hello": 0].hasElement(("hello", 0)))
    ///     // Print "true"
    ///
    /// - Parameter element: A key-value pair
    /// - Returns: `true` if the dictionary has the a key-value pair; otherwise, `false`.
    func hasElement(_ element: Element) -> Bool {
        return self[element.key] == element.value
    }
}
