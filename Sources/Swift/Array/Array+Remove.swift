//
//  Array+Remove.swift
//  SExtensions
//
//  Created by Ray on 2018/7/1.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array {

    /// Returns an array which does not contain the elements at the specified
    /// positions.
    ///
    ///     print(["hello", "world", "!"].removing(at: 0, 1))
    ///     // Prints "["!"]"
    ///
    /// - Parameter positions: The positions of the elements to remove.
    /// - Returns: An array.
    func removing(at positions: Int...) -> Array {
        let elements = enumerated().filter { !positions.contains($0.offset) }
        return elements.map({ $0.element })
    }

    /// Returns an array which does not contain any empty element.
    ///
    ///     print([["", ""], [], "", ["hello": ""], NSNull(), [[""]], [[:]], [["hello": []]]].removingEmpty().isEmpty)
    ///     // Prints "true"
    ///
    /// - Returns: An array.
    func removingEmpty() -> Array {
        var result = Array()
        for element in self {
            if let stringValue = element as? String {
                if !stringValue.isEmpty {
                    result.append(element)
                }
            } else if let dictionaryValue = element as? [String: Any] {
                let removed = dictionaryValue.removingEmpty()
                if !removed.isEmpty {
                    result.append(element)
                }
            } else if let arrayValue = element as? [Any] {
                let removed = arrayValue.removingEmpty()
                if !removed.isEmpty {
                    result.append(element)
                }
            } else if !(element is NSNull) {
                result.append(element)
            }
        }
        return result
    }

}

public extension Array where Element: Equatable {

    /// Returns an array which does not contain the given elements.
    ///
    ///     print(["hello", "world", "!"].removing("hello", "world"))
    ///     // Prints "["!"]"
    ///
    /// - Parameter elements: The elements to remove.
    /// - Returns: An array.
    func removing(_ elements: Element...) -> Array {
        var result = self
        result.removeAll(where: {elements.contains($0)})
        return result
    }

    /// Returns an array which removes the last given element.
    ///
    ///     print([0, 1, 2, 1].removingLast(1))
    ///     // Prints "[0, 1, 2]"
    ///
    /// - Parameter element: The elements to remove.
    /// - Returns: An array.
    func removingLast(_ element: Element) -> Array {
        var result = self
        if let index = lastIndex(of: element) {
            result.remove(at: index)
        }
        return result
    }

    /// Returns an array which does not contain the elements in the given arrays.
    ///
    ///     print(["hello", "world", "!"].removing(["hello"], ["world", "!"]))
    ///     // Prints "[]"
    ///
    /// - Parameter others: The arrays to remove
    /// - Returns: An array.
    func removing(_ others: Array...) -> Array {
        var result = self
        for array in others {
            result = result.filter {
                !array.contains($0)
            }
        }
        return result
    }

    /// Returns an array which does not contain the elements in the given
    /// countable range.
    ///
    ///     print(["hello", "world", "!"].removingCountableRange(0..<2))
    ///     // Prints "["!"]"
    ///
    /// - Parameter range: A countable range.
    /// - Returns: An array.
    func removingCountableRange(_ range: CountableRange<Int>) -> Array {
        if let array = self[safe: range] {
            return removing(array)
        }
        return self
    }

    /// Returns an array which does not contain the elements in the given
    /// countable closed range.
    ///
    ///     print(["hello", "world", "!"].removingCountableClosedRange(0...2))
    ///     // Prints "[]"
    ///
    /// - Parameter range: A countable closed range.
    /// - Returns: An array.
    func removingCountableClosedRange(_ range: CountableClosedRange<Int>) -> Array {
        if let array = self[safe: range] {
            return removing(array)
        }
        return self
    }

    /// Returns an array which does not contain duplicated elements.
    ///
    ///     print(["hello", "world", "!", "hello", "world", "!"].removingDuplicates())
    ///     // Prints "["hello", "world", "!"]"
    ///
    /// - Returns: An array.
    func removingDuplicates() -> Array {
        var result = Array()
        for element in self {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }

}

protocol OptionalProtocol {

    associatedtype Wrapped

    /// Evaluates the given closure when this `Optional` instance is not `nil`,
    /// passing the unwrapped value as a parameter.
    ///
    /// Use the `map` method with a closure that returns a nonoptional value.
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalProtocol {}

extension Array where Element: OptionalProtocol {

    /// Removes all nils.
    ///
    ///     print([0, nil, 1].removeNils())
    ///     // Prints "[0, 1]"
    ///
    /// - Returns: An array with all nils removed.
    func removingNils() -> [Element.Wrapped] {
        var result: [Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }

}
