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
    var whitespaceCondensed: String {
        return condense(text: " ")
    }
    
    /// A newline condensed string.
    var newlineCondensed: String {
        return condense(text: "\n")
    }
    
    /// A underscore condensed string.
    var underscoreCondensed: String {
        return condense(text: "_")
    }
    
    /// Condenses text within a string
    ///
    ///     print("Hello worrrrld!".condense(text: "r"))
    ///     // Prints "Hello world!"
    ///
    /// - Parameter text: text that needs to condense
    /// - Returns: a condensed string
    func condense(text: String) -> String {
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
