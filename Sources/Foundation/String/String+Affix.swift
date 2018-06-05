//
//  String+Affix.swift
//  SExtensions
//
//  Created by Ray on 2018/6/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

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
    
    /// Returns a string with suffex removed.
    ///
    ///     print("Hello world!".removingSuffex("d!"))
    ///     // Prints "Hello worl"
    ///
    /// - Parameter suffex: the suffex needs to remove.
    /// - Returns: a string.
    func removingSuffex(_ suffex: String) -> String {
        if hasSuffix("-\(suffex)") {
            return String(dropLast("-\(suffex)".count))
        }
        if hasSuffix(suffex) {
            return String(dropLast(suffex.count))
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
        self = removingSuffex(suffix)
    }
    
}
