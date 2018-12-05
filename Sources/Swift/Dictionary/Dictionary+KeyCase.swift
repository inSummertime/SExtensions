//
//  Dictionary+KeyCase.swift
//  SExtensions
//
//  Created by Ray on 2018/6/17.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Dictionary where Key == String {

    /// Returns a dictionary with all keys uppercased.
    ///
    ///     print(["hello": 0, "world": 1].uppercasingAllKeys())
    ///     // Prints "["HELLO": 0, "WORLD": 1]"
    ///
    /// - Returns: a dictionary.
    func uppercasingAllKeys() -> Dictionary {
        var result = [String: Value]()
        for (key, value) in self {
            result[key.uppercased()] = value
        }
        return result
    }

    /// Uppercases all keys.
    ///
    ///     var helloWorld = ["hello": 0, "world": 1]
    ///     helloWorld.uppercaseAllKeys()
    ///     print(helloWorld)
    ///     // Prints "["HELLO": 0, "WORLD": 1]"
    mutating func uppercaseAllKeys() {
        self = uppercasingAllKeys()
    }

    /// Returns a dictionary with all keys lowercased.
    ///
    ///     print(["HELLO": 0, "WORLD": 1].lowercasingAllKeys())
    ///     // Prints "["hello": 0, "world": 1]"
    ///
    /// - Returns: a dictionary.
    func lowercasingAllKeys() -> Dictionary {
        var result = [String: Value]()
        for (key, value) in self {
            result[key.lowercased()] = value
        }
        return result
    }

    /// Lowercases all keys.
    ///
    ///     var helloWorld = ["HELLO": 0, "WORLD": 1]
    ///     helloWorld.lowercaseAllKeys()
    ///     print(helloWorld)
    ///     // Prints "["hello": 0, "world": 1]"
    mutating func lowercaseAllKeys() {
        self = lowercasingAllKeys()
    }

    /// Returns a dictionary with all keys capitalized.
    ///
    ///     print(["hello world!": 0, "hi there!": 1].capitalizingAllKeys())
    ///     // Prints "["Hello World!": 0, "Hi There!": 1]"
    ///
    /// - Returns: a dictionary.
    func capitalizingAllKeys() -> Dictionary {
        var result = [String: Value]()
        for (key, value) in self {
            result[key.capitalized] = value
        }
        return result
    }

    /// Capitalizes all keys
    ///
    ///     var helloWorld = ["hello world!": 0, "hi there!": 1]
    ///     helloWorld.capitalizeAllKeys()
    ///     print(helloWorld)
    ///     // Prints "["Hello World!": 0, "Hi There!": 1]"
    mutating func capitalizeAllKeys() {
        self = capitalizingAllKeys()
    }

    /// Returns a dictionary with all keys changed to sentence case.
    ///
    ///     print(["hello world!": 0, "hi there!": 1].changingAllKeysToSentenceCase())
    ///     // Prints "["Hello world!": 0, "Hi there!": 1]"
    ///
    /// - Returns: a dictionary.
    func changingAllKeysToSentenceCase() -> Dictionary {
        var result = [String: Value]()
        for (key, value) in self {
            result[key.changingToSentenseCase()] = value
        }
        return result
    }

    // Changes all keys to sentence case.
    ///
    ///     var helloWorld = ["hello world!": 0, "hi there!": 1]
    ///     helloWorld.changeAllKeysToSentenceCase()
    ///     print(helloWorld)
    ///     // Prints "["Hello world!": 0, "Hi there!": 1]"
    mutating func changeAllKeysToSentenceCase() {
        self = changingAllKeysToSentenceCase()
    }

    /// Returns a dictionary with all keys changed to camel case.
    ///
    ///     print(["hello world!": 0, "hi there!": 1].changingAllKeysToCamelCase())
    ///     // Prints "["helloWorld!": 0, "hiThere!": 1]"
    ///
    /// - Returns: a dictionary.
    func changingAllKeysToCamelCase() -> Dictionary {
        var result = [String: Value]()
        for (key, value) in self {
            result[key.changingToCamelCase()] = value
        }
        return result
    }

    // Changes all keys to camel case.
    ///
    ///     var helloWorld = ["hello world!": 0, "hi there!": 1]
    ///     helloWorld.changeAllKeysToCamelCase()
    ///     print(helloWorld)
    ///     // Prints "["helloWorld!": 0, "hiThere!": 1]"
    mutating func changeAllKeysToCamelCase() {
        self = changingAllKeysToCamelCase()
    }

    /// Returns a dictionary with all keys changed to snake case.
    ///
    ///     print(["hello world!": 0, "hi there!": 1].changingAllKeysToSnakeCase())
    ///     // Prints "["hello_world!": 0, "hi_there!": 1]"
    ///
    /// - Returns: a dictionary.
    func changingAllKeysToSnakeCase() -> Dictionary {
        var result = [String: Value]()
        for (key, value) in self {
            result[key.changingToSnakeCase()] = value
        }
        return result
    }

    // Changes all keys to snake case.
    ///
    ///     var helloWorld = ["hello world!": 0, "hi there!": 1]
    ///     helloWorld.changeAllKeysToSnakeCase()
    ///     print(helloWorld)
    ///     // Prints "["hello_world!": 0, "hi_there!": 1]"
    mutating func changeAllKeysToSnakeCase() {
        self = changingAllKeysToSnakeCase()
    }

}
