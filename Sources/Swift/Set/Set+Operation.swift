//
//  Set+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/10/7.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Set {

    /// Returns a new set with the elements that are different from the given
    /// sets.
    ///
    ///     let set: Set = ["hello", "world"]
    ///     print(set.difference(["hello"], ["!"]))
    ///     // Prints "["!", "world"]"
    ///
    /// - Parameter others: Other sets.
    /// - Returns: A new set.
    func difference(_ others: Set...) -> Set {
        var result = self
        for set in others {
            for element in set {
                if result.contains(element) {
                    result = result.filter({ $0 != element })
                } else {
                    result.insert(element)
                }
            }
        }
        return result
    }

    /// Returns a Boolean value that indicates whether this set contains
    /// the given set.
    ///
    ///     print(["hello", "world"].contains(["hello"]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another set.
    /// - Returns: `true` if the set contains `other`; otherwise, `false`.
    func contains(_ other: Set) -> Bool {
        return other.isSubset(of: self)
    }

    /// Returns a set with the elements to add after comparing the other set.
    ///
    ///     struct Data: Hashable {
    ///         let id: Int
    ///         let title: String
    ///     }
    ///     let set: Set = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
    ///     let anotherSet: Set = [Data(id: 1, title: "hello"), Data(id: 2, title: "world")]
    ///     let result = set.elementsToAdd(other: anotherArray) {
    ///         $0.id == $1.id
    ///     }
    ///     print(result)
    ///     // Prints "[Data(id: 2, title: "world")]"
    ///
    /// - Parameters:
    ///   - other: Another set.
    ///   - isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: A set.
    func elementsToAdd(other: Set, isIncluded: (Element, Element) -> Bool) -> Set {
        var result = other
        for element in self {
            result = result.filter({ !isIncluded($0, element) })
        }
        return result
    }

    /// Returns a set with the elements to remove after comparing the other set.
    ///
    ///     struct Data: Hashable {
    ///         let id: Int
    ///         let title: String
    ///     }
    ///     let set: Set = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
    ///     let anotherSet: Set = [Data(id: 1, title: "hello"), Data(id: 2, title: "world")]
    ///     let result = set.elementsToRemove(other: anotherSet) {
    ///         $0.id == $1.id
    ///     }
    ///     print(result)
    ///     // Prints "[Data(id: 0, title: "hello")]"
    ///
    /// - Parameters:
    ///   - other: Another set.
    ///   - isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: A set.
    func elementsToRemove(other: Set, isIncluded: (Element, Element) -> Bool) -> Set {
        var result = self
        for element in other {
            result = result.filter({ !isIncluded($0, element) })
        }
        return result
    }

    /// Returns a set with the elements to update after comparing the other set.
    ///
    ///     struct Data: Hashable {
    ///         let id: Int
    ///         let title: String
    ///     }
    ///     let set: Set = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
    ///     let anotherSet: Set = [Data(id: 1, title: "hello"), Data(id: 2, title: "world")]
    ///     let result = set.elementsToUpdate(other: anotherSet) {
    ///         $0.id == $1.id
    ///     }
    ///     print(result)
    ///     // Prints "[Data(id: 1, title: "hello")]"
    ///
    /// - Parameters:
    ///   - other: Another set.
    ///   - isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: A set.
    func elementsToUpdate(other: Set, isIncluded: (Element, Element) -> Bool) -> Set {
        var result = Set<Element>()
        for element in self {
            for elementOther in other where isIncluded(element, elementOther) {
                result.insert(elementOther)
            }
        }
        return result
    }
}
