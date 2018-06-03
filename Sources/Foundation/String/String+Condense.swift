//
//  String+Condense.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// A whitespace condensed string.
    ///
    ///     print("Hello  world!".whitespaceCondensed)
    ///     // Prints "Hello world!"
    var whitespaceCondensed: String {
        return condensing(text: " ")
    }
    
    /// A newline condensed string.
    ///
    ///     print("Hello world!\n\n".newlineCondensed)
    ///     // Prints "Hello world\n!"
    var newlineCondensed: String {
        return condensing(text: "\n")
    }
    
    /// A underscore condensed string.
    ///
    ///     print("Hello__world!".underscoreCondensed)
    ///     // Prints "Hello_world!"
    var underscoreCondensed: String {
        return condensing(text: "_")
    }
    
    /// Returns a string with a text condensed
    ///
    ///     print("Hello worrrrld!".condense(text: "r"))
    ///     // Prints "Hello world!"
    ///
    /// - Parameter text: text that needs to condense
    /// - Returns: a condensed string
    func condensing(text: String) -> String {
        let joined = components(separatedBy: text).filter { !$0.isEmpty }.joined(separator: text)
        if let first = first, let last = last, String(first) == text, String(last) == text {
            return text + joined + text
        } else if let first = first, String(first) == text {
            return text + joined
        } else if let last = last, String(last) == text {
            return joined + text
        } else {
            return joined
        }
    }
    
}
