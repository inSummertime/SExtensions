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
    ///
    ///     print(" \nhello \nworld\n ".trimmed)
    ///     // Prints "hello \nworld"
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// A string with all start whitespaces and newlines trimmed.
    ///
    ///     print(" \nHello \nworld!\n ".startTrimmed)
    ///     // Prints "Hello \nworld!\n"
    var startTrimmed: String {
        return trimmingStartCharacters(in: .whitespacesAndNewlines)
    }
    
    /// A string with all end whitespaces and newlines trimmed.
    ///
    ///     print(" \nHello \nworld!\n ".endTrimmed)
    ///     // Prints " \nHello \nworld!"
    var endTrimmed: String {
        return trimmingEndCharacters(in: .whitespacesAndNewlines)
    }
    
    /// A string with all whitespaces trimmed.
    ///
    ///     print(" \nHello \nworld!\n ".whitespaceTrimmed)
    ///     // Prints "\nHello \nworld!\n"
    var whitespaceTrimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    /// A string with all start whitespaces trimmed.
    ///
    ///     print(" \nHello \nworld!\n ".startWhitespaceTrimmed)
    ///     // Prints "\nHello \nworld!\n "
    var startWhitespaceTrimmed: String {
        return trimmingStartCharacters(in: .whitespaces)
    }
    
    /// A string with all end whitespaces trimmed.
    ///
    ///     print(" \nHello \nworld!\n ".endWhitespaceTrimmed)
    ///     // Prints " \nHello \nworld!\n"
    var endWhitespaceTrimmed: String {
        return trimmingEndCharacters(in: .whitespaces)
    }
    
    /// A string with all newline trimmed.
    ///
    ///     print("\n\nHellon\nworld!\n\n".newlineTrimmed)
    ///     // Prints "Hello\n\nworld!\n"
    var newlineTrimmed: String {
        return trimmingCharacters(in: CharacterSet.newlines)
    }
    
    /// A string with all start newlines trimmed
    ///
    ///     print("\n\nhello\n\nworld!\n\n".startNewlineTrimmed)
    ///     // Prints "hello\n\nworld!\n\n"
    var startNewlineTrimmed: String {
        return trimmingStartCharacters(in: .newlines)
    }
    
    /// A string with all end newlines trimmed.
    ///
    ///     print("\n\nhello\n\nworld!\n\n".endNewlineTrimmed)
    ///     // Prints "\n\nhello\n\nworld!"
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
    func trimmingText(_ text: String) -> String {
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
    mutating func trimText(_ text: String) {
        self = trimmingText(text)
    }
    
}
