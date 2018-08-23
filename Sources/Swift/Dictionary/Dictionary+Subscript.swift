//
//  Dictionary+Subscript.swift
//  SExtensions
//
//  Created by Ray on 2018/6/13.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Dictionary where Key == String {
    
    /// Accesses the String value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": "world"][string: "hello"])
    ///     // Prints "Optional("world")"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The String value associated with `key` if `key` is in the dictionary; otherwise, `nil`.
    subscript(string key: String) -> String? {
        get {
            return self[key] as? String
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the String value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": "world"][stringValue: "hello"])
    ///     // Prints "world"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The String value associated with `key` if `key` is in the dictionary; otherwise, "".
    subscript(stringValue key: String) -> String {
        get {
            return self[key] as? String ?? ""
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Int value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": 1][int: "hello"])
    ///     // Prints "Optional(1)"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int value associated with `key` if `key` is in the dictionary; otherwise, `nil`.
    subscript(int key: String) -> Int? {
        get {
            return self[key] as? Int
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Int value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": 1][intValue: "hello"])
    ///     // Prints "1"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int value associated with `key` if `key` is in the dictionary; otherwise, 0.
    subscript(intValue key: String) -> Int {
        get {
            return self[key] as? Int ?? 0
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Double value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": 1.0][double: "hello"])
    ///     // Prints "Optional(1.0)"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Double value associated with `key` if `key` is in the dictionary; otherwise, `nil`.
    subscript(double key: String) -> Double? {
        get {
            return self[key] as? Double
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Double value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": 1.0][doubleValue: "hello"])
    ///     // Prints "1.0"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Double value associated with `key` if `key` is in the dictionary; otherwise, 0.0.
    subscript(doubleValue key: String) -> Double {
        get {
            return self[key] as? Double ?? 0.0
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Array value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": ["hello", "world"]][array: "hello"])
    ///     // Prints "Optional(["hello", "world"])"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Array value associated with `key` if `key` is in the dictionary; otherwise, `nil`.
    subscript(array key: String) -> [Any]? {
        get {
            return self[key] as? [Any]
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Array value associated with the given key for reading and
    /// writing.
    ///
    ///     print(["hello": ["hello", "world"]][arrayValue: "hello"])
    ///     // Prints ["hello", "world"]
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Array value associated with `key` if `key` is in the dictionary; otherwise, [Any]().
    subscript(arrayValue key: String) -> [Any] {
        get {
            return self[key] as? [Any] ?? [Any]()
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Dictionary value associated with the given key for reading
    /// and writing.
    ///
    ///     print(["hello": ["hello": "world"]][dictionary: "hello"])
    ///     // Prints "Optional(["hello": "world"])"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Dictionary value associated with `key` if `key` is in the dictionary; otherwise, `nil`.
    subscript(dictionary key: String) -> [String: Any]? {
        get {
            return self[key] as? [String: Any]
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    /// Accesses the Dictionary value associated with the given key for reading
    /// and writing.
    ///
    ///     print(["hello": ["hello": "world"]][dictionaryValue: "hello"])
    ///     // Prints "["hello": "world"]"
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Dictionary value associated with `key` if `key` is in the dictionary; otherwise, [String: Any]().
    subscript(dictionaryValue key: String) -> [String: Any] {
        get {
            return self[key] as? [String: Any] ?? [String: Any]()
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
}
