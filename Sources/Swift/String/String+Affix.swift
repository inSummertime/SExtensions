//
//  String+Affix.swift
//  SExtensions
//
//  Created by Ray on 2018/6/6.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {
    
    /// Returns a string with prefix removed.
    ///
    ///     print("Hello world!".removingPrefix("Hello"))
    ///     // Prints " world!"
    ///
    /// - Parameter prefix: the prefix needs to remove.
    /// - Returns: a string.
    func removingPrefix(_ prefix: String) -> String {
        if hasPrefix("\(prefix)-") {
            return String(dropFirst("\(prefix)-".count))
        }
        if hasPrefix(prefix) {
            return String(dropFirst(prefix.count))
        }
        return self
    }
    
    /// Removes prefix.
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.removePrefix("Hello")
    ///     print(helloWorld)
    ///     // Prints " world!"
    ///
    /// - Parameter prefix: the prefix needs to remove.
    mutating func removePrefix(_ prefix: String) {
        self = removingPrefix(prefix)
    }
    
    /// Returns a new string which is remove the first 'count' charaters
    ///
    ///     print("Hello world!".removingPrefix(1))
    ///     // Prints "ello world!"
    ///
    /// - Parameter count: the count of charaters need to remove
    func removingPrefix(_ count: Int = 1) -> String {
        if self.count > count {
            let index = self.index(startIndex, offsetBy: count)
            return String(self[index..<endIndex])
        } else {
            return ""
        }
    }
    
    /// Removes the first 'count' charaters
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.removePrefix(1)
    ///     print(helloWorld)
    ///     // Prints "ello  world!"
    ///
    /// - Parameter count: the count of charaters need to remove
    mutating func removePrefix(_ count: Int = 1) {
        self = removingPrefix(count)
    }
    
    /// Returns a string with suffex removed.
    ///
    ///     print("Hello world!".removingSuffex("d!"))
    ///     // Prints "Hello worl"
    ///
    /// - Parameter suffex: the suffex needs to remove.
    /// - Returns: a string.
    func removingSuffix(_ suffix: String) -> String {
        if hasSuffix("-\(suffix)") {
            return String(dropLast("-\(suffix)".count))
        }
        if hasSuffix(suffix) {
            return String(dropLast(suffix.count))
        }
        return self
    }
    
    /// Removes suffix.
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.removeSuffix("d!")
    ///     print(helloWorld)
    ///     // Prints "Hello worl"
    ///
    /// - Parameter suffix: the suffix needs to remove.
    mutating func removeSuffix(_ suffix: String) {
        self = removingSuffix(suffix)
    }
    
    /// Returns a new string which is remove the last 'count' charaters
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.removeSuffix(1)
    ///     print(helloWorld)
    ///     // Prints "Hello world"
    ///
    /// - Parameter count: the count of charaters need to remove
    func removingSuffix(_ count: Int = 1) -> String {
        if self.count > count {
            let index = self.index(endIndex, offsetBy: -count)
            return String(self[..<index])
        } else {
            return ""
        }
    }
    
    /// Removes the last 'count' charaters
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.removeSuffix(1)
    ///     print(helloWorld)
    ///     // Prints "Hello  world"
    ///
    /// - Parameter count: the count of charaters need to remove
    mutating func removeSuffix(_ count: Int = 1) {
        self = removingSuffix(count)
    }
    
}
