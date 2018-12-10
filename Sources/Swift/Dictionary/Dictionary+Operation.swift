//
//  Dictionary+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/6/16.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Dictionary {

    /// Returns a union dictionary of this dictionary and the given
    /// dictionaries.
    ///
    ///     print(["hello": 0].union(["hello": 1, "world": 1]))
    ///     // Prints "["hello": 1, "world": 1]"
    ///
    /// - Parameters:
    ///   - others: Other dictionaries.
    /// - Returns: A dictionary.
    func union(_ others: [Key: Value]...) -> [Key: Value] {
        var result = self
        for dictionary in others {
            for (key, value) in dictionary {
                result[key] = value
            }
        }
        return result
    }

}

public extension Dictionary where Value: Equatable {

    /// Returns a union dictionary of this dictionary and the given dictionaries
    /// having the same key but different value removed.
    ///
    ///     print(["hello": 0].unionWithoutSameKeyDifferentValue(["hello": 1, "world": 1]))
    ///     // Prints "["world": 1]"
    ///
    /// - Parameters:
    ///   - others: Other dictionaries.
    /// - Returns: A dictionary.
    func unionWithoutSameKeyDifferentValue(_ others: [Key: Value]...) -> [Key: Value] {
        var result = self
        for dictionary in others {
            for (key, value) in dictionary {
                if let v = self[key] {
                    if v != value {
                        result.removeValue(forKey: key)
                    }
                } else {
                    result[key] = value
                }
            }
        }
        return result
    }

    /// Returns a new dictionary with the elements that are common to both this
    /// dictionary and the given dictionaries.
    ///
    ///     print(["hello": 0].intersection(["hello": 0, "world": 1]))
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameter others: Other dictionaries.
    /// - Returns: A new dictionary.
    func intersection(_ others: [Key: Value]...) -> [Key: Value] {
        var result = [Key: Value]()
        for dictionary in others {
            for (key, value) in dictionary {
                if let v = self[key], v == value {
                    result[key] = value
                }
            }
        }
        return result
    }

    /// Returns a new dictionary with the elements that are different from the
    /// given dictionaries.
    ///
    ///     print(["hello": 0].difference(["hello": 0, "world": 1])
    ///     // Prints "["world": 1]"
    ///
    /// - Parameter others: other dictionaries
    /// - Returns: a new dictionary
    func difference(_ others: [Key: Value]...) -> [Key: Value] {
        var result = self
        for dictionary in others {
            for (key, value) in dictionary {
                if result[key] == nil {
                    result[key] = value
                } else {
                    result.removeValue(forKey: key)
                }
            }
        }
        return result
    }

    /// Returns a new dictionary containing the elements of this dictionary that
    /// do not occur in the given dictionaries.
    ///
    ///     print(["hello": 0].intersection(["hello": 0, "world": 1]))
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameter other: Other dictionaries.
    /// - Returns:  A new dictionary.
    func subtracting(_ others: [Key: Value]...) -> [Key: Value] {
        var result = self
        for dictionary in others {
            for (key, value) in dictionary where value == self[key] {
                result.removeValue(forKey: key)
            }
        }
        return result
    }

    /// Removes the elements of this dictionary that do not occur in the given
    /// dictionaries.
    ///
    ///     var helloWorld = ["hello": 0, "world": 1]
    ///     helloWorld.subtract(["world": 1])
    ///     print(helloWorld)
    ///     // Prints "["hello": 0]"
    ///
    /// - Parameter other: Other dictionaries.
    mutating func subtract(_ others: [Key: Value]...) {
        for dictionary in others {
            for (key, value) in dictionary where value == self[key] {
                removeValue(forKey: key)
            }
        }
    }

    /// Returns a Boolean value that indicates whether this dictionary is a
    /// subdictionary of the given dictionary.
    ///
    ///     print(["hello": 0].isSubdictionary(of: ["hello": 0, "world": 1]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another dictionary.
    /// - Returns: `true` if the dictionary is a subdictionary of `other`; otherwise, `false`.
    func isSubdictionary(of other: [Key: Value]) -> Bool {
        if isEmpty || other.isEmpty {
            return false
        }
        for (key, value) in self {
            if let v = other[key] {
                if v != value {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }

    /// Returns a Boolean value that indicates whether the dictionary is a
    /// strict subdictionary of the given dictionary.
    ///
    ///     print(["hello": 0].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
    ///     // Prints "true"
    ///
    /// - Parameter other:  Another dictionary.
    /// - Returns: `true` if the dictionary is a strict subdictionary of `other`; otherwise, `false`.
    func isStrictSubdictionary(of other: [Key: Value]) -> Bool {
        if self == other {
            return false
        }
        return isSubdictionary(of: other)
    }

}
