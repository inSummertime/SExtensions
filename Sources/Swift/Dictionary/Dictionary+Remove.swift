//
//  Dictionary+Remove.swift
//  SExtensions
//
//  Created by Ray on 2018/7/1.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Dictionary {

    /// Returns a dictionary which does not contains the values for keys
    ///
    ///     print(["hello": "", "world": ""].removingValueForKeys("hello", "world").isEmpty)
    ///     // Prints "true"
    ///
    /// - Parameter keys: The positions of the key-value pair to remove.
    /// - Returns: a dictionary.
    func removingValueForKeys(_ keys: Key...) -> Dictionary {
        var result = self
        for key in keys {
            result.removeValue(forKey: key)
        }
        return result
    }

}

public extension Dictionary where Value: Equatable {

    /// Returns a dictionary which does not contains the values.
    ///
    ///     print(["hello": "world", "!": ""].removingValues("world", "").isEmpty)
    ///     // Prints "true"
    ///
    /// - Parameter values: The values to remove.
    /// - Returns: a dictionary.
    func removingValues(_ values: Value...) -> Dictionary {
        var result = self
        for value in values {
            result = result.filter({ $0.value != value })
        }
        return result
    }

}

public extension Dictionary where Key == String {

    /// Returns a dictionary which does not contain empty elements.
    ///
    ///     print(["hello": ["hello": [""]], "world": ["", ["": ""]], "!": "", "Null": NSNull()].removingEmpty().isEmpty)
    ///     // Prints "true"
    ///
    /// - Returns: a dictionary.
    func removingEmpty() -> Dictionary {
        var result = self
        for (key, value) in self {
            if key.isEmpty {
                result.removeValue(forKey: key)
            }
            if let stringValue = value as? String, stringValue.isEmpty {
                result.removeValue(forKey: key)
            }
            if let dictionaryValue = value as? [String: Any] {
                if dictionaryValue.isEmpty {
                    result.removeValue(forKey: key)
                } else {
                    let removed = dictionaryValue.removingEmpty()
                    if removed.isEmpty {
                        result.removeValue(forKey: key)
                    } else {
                        result[key] = removed as? Value
                    }
                }
            }
            if let arrayValue = value as? [Any] {
                let removed = arrayValue.removingEmpty()
                if removed.isEmpty {
                    result.removeValue(forKey: key)
                } else {
                    result[key] = removed as? Value
                }
            }
            if value is NSNull {
                result.removeValue(forKey: key)
            }

        }
        return result
    }

}

extension Dictionary where Value: OptionalProtocol {

    /// Removes nils.
    ///
    /// - Returns: A dictionary.
    func removingNils() -> [Key: Value.Wrapped] {
        var result: [Key: Value.Wrapped] = [:]
        for (key, value) in self {
            if let unwrappedValue = value.map({ $0 }) {
                result[key] = unwrappedValue
            }
        }
        return result
    }

}
