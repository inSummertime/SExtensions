//
//  String+Trim.swift
//  SExtensions
//
//  Created by Ray on 2018/6/1.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// A whitespaces and newlines trimmed string.
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// A start whitespace and newlines trimmed string.
    var startTrimmed: String {
        return trimmingStartCharacters(in: .whitespacesAndNewlines)
    }
    
    /// A end whitespace and newlines trimmed string.
    var endTrimmed: String {
        return trimmingEndCharacters(in: .whitespacesAndNewlines)
    }
    
    /// A whitespace trimmed string.
    var whitespaceTrimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    /// A start whitespace trimmed string.
    var startWhitespaceTrimmed: String {
        return trimmingStartCharacters(in: .whitespaces)
    }
    
    /// A end whitespace trimmed string.
    var endWhitespaceTrimmed: String {
        return trimmingEndCharacters(in: .whitespaces)
    }
    
    /// A newline trimmed string.
    var newlineTrimmed: String {
        return trimmingCharacters(in: CharacterSet.newlines)
    }
    
    /// A start newline trimmed string
    var startNewlineTrimmed: String {
        return trimmingStartCharacters(in: .newlines)
    }
    
    /// A end newline trimmed string.
    var endNewlineTrimmed: String {
        return trimmingEndCharacters(in: .newlines)
    }
    
    /// Trims start with a character set.
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
    
    /// Trims end with a character set.
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
    
    /// Trims text with a string.
    ///
    ///     print("Hello world!".trim(text: "l"))
    ///     // Prints "Heo word!"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    func trim(text: String) -> String {
        return replacingOccurrences(of: text, with: "")
    }
    
    /// Trims start text.
    ///
    ///     print("Hello world!".trimStart(text: "Hello"))
    ///     // Prints " world!"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    func trimStart(text: String) -> String {
        if let range = range(of: text) {
            if range.lowerBound > startIndex {
                return self
            }
            return String(self[range.upperBound..<endIndex])
        } else {
            return self
        }
    }
    
    /// Trims end text.
    ///
    ///     print("Hello world!".trimEnd(text: "d!"))
    ///     // Prints "Hello worl"
    ///
    /// - Parameter text: the text needs to trim.
    /// - Returns: a trimmed string.
    func trimEnd(text: String) -> String {
        if let range = range(of: text, options: .backwards, range: nil, locale: nil) {
            if range.upperBound < endIndex {
                return self
            }
            return String(self[startIndex..<range.lowerBound])
        }
        return self
    }
    
}
