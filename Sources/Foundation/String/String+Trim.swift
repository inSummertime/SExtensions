//
//  String+Trim.swift
//  SExtensions
//
//  Created by Ray on 2018/6/1.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// A string with all whitespaces and newlines trimmed.
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// A string with all start whitespaces and newlines trimmed.
    var startTrimmed: String {
        return trimmingStartCharacters(in: .whitespacesAndNewlines)
    }
    
    /// A string with all end whitespaces and newlines trimmed.
    var endTrimmed: String {
        return trimmingEndCharacters(in: .whitespacesAndNewlines)
    }
    
    /// A string with all whitespaces trimmed.
    var whitespaceTrimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    /// A string with all start whitespaces trimmed.
    var startWhitespaceTrimmed: String {
        return trimmingStartCharacters(in: .whitespaces)
    }
    
    /// A string with all end whitespaces trimmed.
    var endWhitespaceTrimmed: String {
        return trimmingEndCharacters(in: .whitespaces)
    }
    
    /// A string with all newline trimmed.
    var newlineTrimmed: String {
        return trimmingCharacters(in: CharacterSet.newlines)
    }
    
    /// A string with all start newlines trimmed
    var startNewlineTrimmed: String {
        return trimmingStartCharacters(in: .newlines)
    }
    
    /// A string with all end newlines trimmed.
    var endNewlineTrimmed: String {
        return trimmingEndCharacters(in: .newlines)
    }
    
    /// Returns a string with the start trimmed with a character set.
    ///
    ///     print("!Hello world!".trimmingStartCharacters(in: .punctuationCharacters))
    ///     // Prints "Hello world!"
    ///
    /// - Parameter characterSet: a character set.
    /// - Returns: a trimmed string.
    func trimmingStartCharacters(in set: CharacterSet) -> String {
        if let range = rangeOfCharacter(from: set.inverted) {
            return String(self[range.lowerBound..<endIndex])
        }
        return self
    }
    
    /// Returns a string with the end trimmed with a character set.
    ///
    ///     print("Hello world!".trimmingEndCharacters(in: .punctuationCharacters))
    ///     // Prints "Hello world"
    ///
    /// - Parameter set: a character set.
    /// - Returns: a trimmed string.
    func trimmingEndCharacters(in set: CharacterSet) -> String {
        if let range = rangeOfCharacter(from: set.inverted, options: .backwards) {
            return String(self[startIndex..<range.upperBound])
        }
        return self
    }
    
    /// Returns a string with the text trimmed.
    ///
    ///     print("Hello world!".trim(text: "l"))
    ///     // Prints "Heo word!"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    func trimming(text: String) -> String {
        return replacingOccurrences(of: text, with: "")
    }
    
    /// Trims text with a string.
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.trimmed(text: "l")
    ///     print(helloWorld)
    ///     // Prints "Heo word!"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    mutating func trim(text: String) {
        self = trimming(text: text)
    }
    
    /// Returns a string with the start text trimmed.
    ///
    ///     print("Hello world!".trimStart(text: "Hello"))
    ///     // Prints " world!"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    func trimmingStart(text: String) -> String {
        if let range = range(of: text) {
            if range.lowerBound > startIndex {
                return self
            }
            return String(self[range.upperBound..<endIndex])
        } else {
            return self
        }
    }
    
    /// Trims start text.
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.trimmedStart(text: "Hello")
    ///     print(helloWorld)
    ///     // Prints " world!"
    ///
    /// - Parameter text: the text needs to trim.
    mutating func trimStart(text: String) {
        self = trimmingStart(text: text)
    }
    
    /// Returns a string with the end text trimmed.
    ///
    ///     print("Hello world!".trimEnd(text: "d!"))
    ///     // Prints "Hello worl"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    func trimmingEnd(text: String) -> String {
        if let range = range(of: text, options: .backwards, range: nil, locale: nil) {
            if range.upperBound < endIndex {
                return self
            }
            return String(self[startIndex..<range.lowerBound])
        }
        return self
    }
    
    /// Trims end text.
    ///
    ///     var helloWorld = "Hello world!"
    ///     helloWorld.trimEnd(text: "d!")
    ///     print(helloWorld)
    ///     // Prints "Hello worl"
    ///
    /// - Parameter text: the text needs to trim.
    mutating func trimEnd(text: String) {
        self = trimmingEnd(text: text)
    }
    
}
