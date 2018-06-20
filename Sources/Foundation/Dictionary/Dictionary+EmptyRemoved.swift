//
//  Dictionary+EmptyRemoved.swift
//  SExtensions
//
//  Created by Ray on 2018/6/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Dictionary where Key == String {
    
    /// All the empty strings, arrays and dictionaries removed version
    ///     print(["hello": "world", "!": ""].emptyRemoved)
    ///     // Print "["hello": "world"]"
    var emptyRemoved: [String: Any] {
        
        func removingEmptyDictionary(_ dictionary: [String: Any]) -> [String: Any] {
            var result = dictionary
            for (key, value) in dictionary {
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
                        let removed = removingEmptyDictionary(dictionaryValue)
                        if removed.isEmpty {
                            result.removeValue(forKey: key)
                        } else {
                            result[key] = removed
                        }
                    }
                }
                if let arrayValue = value as? [Any] {
                    let removed = removingEmptyArray(arrayValue)
                    if removed.isEmpty {
                        result.removeValue(forKey: key)
                    } else {
                        result[key] = removed
                    }
                }
                if value is NSNull {
                    result.removeValue(forKey: key)
                }
            }
            return result
        }
        
        func removingEmptyArray(_ array: [Any]) -> [Any] {
            var result = [Any]()
            for value in array {
                if let stringValue = value as? String {
                    if !stringValue.isEmpty {
                        result.append(stringValue)
                    }
                } else if let dictionaryValue = value as? [String: Any] {
                    let removed = removingEmptyDictionary(dictionaryValue)
                    if !removed.isEmpty {
                        result.append(value)
                    }
                } else if let subArrayValue = value as? [Any] {
                    let removed = removingEmptyArray(subArrayValue)
                    if !removed.isEmpty {
                        result.append(subArrayValue)
                    }
                } else if !(value is NSNull) {
                    result.append(value)
                }
            }
            return result
        }
        
        return removingEmptyDictionary(self)
    }
    
}
