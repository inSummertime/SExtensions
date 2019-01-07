//
//  Array+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/6/27.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Array where Element: Equatable {

    /// Returns a new array with the elements of both this array and the given
    /// arrays.
    ///
    ///     print(["hello", "world"].union(["!"], ["hello"])
    ///     // Prints "["hello", "world", "!"]"
    ///
    /// - Parameter others: Other arrays.
    /// - Returns: A new array with the unique elements of this array and
    ///   `others`.
    func union(_ others: Array...) -> Array {
        var result = self
        for array in others {
            let differences = array.filter({
                !contains($0)
            })
            result += differences
        }
        return result
    }

    /// Returns a new array with the elements that are common to both this array
    /// and the given arrays.
    ///
    ///     print(["hello", "world"].intersection(["hello"])
    ///     // Prints "["hello"]"
    ///
    /// - Parameter others: Other arrays
    /// - Returns: A new array.
    func intersection(_ others: Array...) -> Array {
        var temp = self
        var result = Array()
        for (index, array) in others.enumerated() {
            if index > 0 {
                temp = result
                result.removeAll()
            }
            result += array.filter({
                temp.contains($0)
            })
        }
        return result
    }

    /// Returns a new array with the elements that are different from the given
    /// arrays.
    ///
    ///     print(["hello", "world"].difference(["hello"]))
    ///     // Prints "["world"]"
    ///
    /// - Parameter others: Other arrays.
    /// - Returns: A new array.
    func difference(_ others: Array...) -> Array {
        var result = self
        for array in others {
            for element in array {
                if result.contains(element) {
                    result = result.filter({ $0 != element })
                } else {
                    result.append(element)
                }
            }
        }
        return result
    }

    /// Returns a new array containing the elements of this array that do not
    /// occur in the given arrays.
    ///
    ///     print(["hello", "world", "!"].subtracting(["hello"]))
    ///     // Prints "["world", "!"]"
    ///
    /// - Parameter others: Other array
    /// - Returns: a new array
    func subtracting(_ others: Array...) -> Array {
        var result = self
        for array in others {
            for element in array {
                if contains(element) {
                    result = result.filter({ $0 != element })
                }
            }
        }
        return result
    }

    /// Returns a Boolean value that indicates whether this array is a subarray
    /// of the given array.
    ///
    ///     print(["hello"].isSubarray(of: ["hello", "world"]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another array.
    /// - Returns: `true` if the array is a subarray of `other`; otherwise,
    ///   `false`.
    func isSubarray(of other: Array) -> Bool {
        if self == other {
            return true
        }
        if other.isEmpty {
            return false
        }
        if isEmpty {
            return true
        }
        for element in self {
            if !other.contains(element) {
                return false
            }
        }
        return true
    }

    /// Returns a Boolean value that indicates whether the array is a strict
    /// subarray of the given array.
    ///
    ///     print(["hello"].isStrictSubarray(of: ["hello"]))
    ///     // Prints "false"
    ///
    /// - Parameter other:  Another array.
    /// - Returns: `true` if the array is a strict subarray of `other`;
    ///   otherwise, `false`.
    func isStrictSubarray(of other: Array) -> Bool {
        if self == other {
            return false
        }
        return isSubarray(of: other)
    }

    /// Returns a Boolean value that indicates whether this array contains
    /// the given array.
    ///
    ///     print(["hello", "world"].contains(["hello"]))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another array.
    /// - Returns: `true` if the array contains `other`; otherwise, `false`.
    func contains(_ other: Array) -> Bool {
        return other.isSubarray(of: self)
    }

    /// Returns an array with the elements to add after comparing the other array.
    ///
    ///     struct Data: Equatable {
    ///         let id: Int
    ///         let title: String
    ///     }
    ///     let array = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
    ///     let anotherArray = [Data(id: 1, title: "hello"), Data(id: 2, title: "world")]
    ///     let result = array.elementsToAdd(other: anotherArray) {
    ///         $0.id == $1.id
    ///     }
    ///     print(result)
    ///     // Prints "[Data(id: 2, title: "world")]"
    ///
    /// - Parameters:
    ///   - other: Another array.
    ///   - isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: An array.
    func elementsToAdd(other: Array, isIncluded: (Element, Element) -> Bool) -> Array {
        var result = other
        for element in self {
            for elementOther in other {
                if isIncluded(element, elementOther) {
                    result = result.filter({ $0 != elementOther })
                }
            }
        }
        return result
    }

    /// Returns an array with the elements to remove after comparing the other array.
    ///
    ///     struct Data: Equatable {
    ///         let id: Int
    ///         let title: String
    ///     }
    ///     let array = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
    ///     let anotherArray = [Data(id: 1, title: "hello"), Data(id: 2, title: "world")]
    ///     let result = array.elementsToRemove(other: anotherArray) {
    ///         $0.id == $1.id
    ///     }
    ///     print(result)
    ///     // Prints "[Data(id: 0, title: "hello")]"
    ///
    /// - Parameters:
    ///   - other: Another array.
    ///   - isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: An array.
    func elementsToRemove(other: Array, isIncluded: (Element, Element) -> Bool) -> Array {
        var result = self
        for element in self {
            for elementOther in other {
                if isIncluded(element, elementOther) {
                    result = result.filter({ (el) -> Bool in
                        el != element
                    })
                    result = result.filter({ $0 != element })
                }
            }
        }
        return result
    }

}

public extension Array {

    /// Returns an array with the elements to update after comparing the other array.
    ///
    ///     struct Data: Equatable {
    ///         let id: Int
    ///         let title: String
    ///     }
    ///     let array = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
    ///     let anotherArray = [Data(id: 1, title: "hello"), Data(id: 2, title: "world")]
    ///     let result = array.elementsToUpdate(other: anotherArray) {
    ///         $0.id == $1.id
    ///     }
    ///     print(result)
    ///     // Prints "[Data(id: 1, title: "hello")]"
    ///
    /// - Parameters:
    ///   - other: Another array.
    ///   - isIncluded: A closure that takes a element as its
    ///   argument and returns a Boolean value indicating whether the element
    ///   should be included.
    /// - Returns: An array.
    func elementsToUpdate(other: Array, isIncluded: (Element, Element) -> Bool) -> Array {
        var result = [Element]()
        for element in self {
            for elementOther in other {
                if isIncluded(element, elementOther) {
                    result.append(elementOther)
                }
            }
        }
        return result
    }

}
