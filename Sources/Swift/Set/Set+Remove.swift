//
//  Set+Remove.swift
//  SExtensions
//
//  Created by Ray on 2018/10/10.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Set {
    
    /// Returns a set which does not contain any empty element.
    ///
    ///     let emptyDictionaryValueSet: Set<[String: String]> = [["hello": ""]]
    ///     print(emptyDictionaryValueSet.removingEmpty().isEmpty)
    ///     // Prints "true"
    ///
    /// - Returns: A set.
    func removingEmpty() -> Set {
        var result = Set()
        for element in self {
            if let stringValue = element as? String {
                if !stringValue.isEmpty {
                    result.insert(element)
                }
            } else if let dictionaryValue = element as? [String: Any] {
                let removed = dictionaryValue.removingEmpty()
                if !removed.isEmpty {
                    result.insert(element)
                }
            } else if let arrayValue = element as? [Any] {
                let removed = arrayValue.removingEmpty()
                if !removed.isEmpty {
                    result.insert(element)
                }
            } else if !(element is NSNull) {
                result.insert(element)
            }
        }
        return result
    }
    
    /// Returns a set which does not contain the given elements.
    ///
    ///     print(["hello", "world", "!"].removing("hello", "world"))
    ///     // Prints "["!"]"
    ///
    /// - Parameter elements: The elements to remove.
    /// - Returns: A set.
    func removing(_ elements: Element...) -> Set {
        var result = self
        for element in elements {
            if let index = result.index(of: element) {
                result.remove(at: index)
            }
        }
        return result
    }
    
}

extension Set where Element: OptionalProtocol, Element.Wrapped: Hashable {
    
    /// Removes all nils.
    ///
    ///     print([0, nil, 1].removeNils())
    ///     // Prints "[0, 1]"
    ///
    /// - Returns: A set with all nils removed.
    func removingNils() -> Set<Element.Wrapped> {
        var result = Set<Element.Wrapped>()
        for element in self {
            if let element = element.map({ $0 }) {
                result.insert(element)
            }
        }
        return result
    }
    
}
