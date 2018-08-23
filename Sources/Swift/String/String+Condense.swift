//
//  String+Condense.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

public extension String {
    
    /// A whitespace condensed string.
    ///
    ///     print("Hello  world!".whitespaceCondensed)
    ///     // Prints "Hello world!"
    var whitespaceCondensed: String {
        return condensingString(" ")
    }
    
    /// A newline condensed string.
    ///
    ///     print("Hello world!\n\n".newlineCondensed)
    ///     // Prints "Hello world\n!"
    var newlineCondensed: String {
        return condensingString("\n")
    }
    
    /// A underscore condensed string.
    ///
    ///     print("Hello__world!".underscoreCondensed)
    ///     // Prints "Hello_world!"
    var underscoreCondensed: String {
        return condensingString("_")
    }
    
    /// Returns a string with a letter condensed
    ///
    ///     print("Hello worrrrld!".condensingString("r"))
    ///     // Prints "Hello world!"
    ///
    /// - Parameter letter: a letter that needs to condense
    /// - Returns: a condensed string
    func condensingString(_ string: String) -> String {
        let joined = components(separatedBy: string).filter { !$0.isEmpty }.joined(separator: string)
        if let first = first, let last = last, String(first) == string, String(last) == string {
            return string + joined + string
        } else if let first = first, String(first) == string {
            return string + joined
        } else if let last = last, String(last) == string {
            return joined + string
        } else {
            return joined
        }
    }
    
}
