//
//  NSAttributedString+Concatenate.swift
//  SExtensions
//
//  Created by Ray on 2018/6/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /// Returns the concatenation of lhs and rhs
    ///
    ///     let hello = NSAttributedString(string: "Hello")
    ///     let world = NSAttributedString(string: " world!")
    ///     print((hello + world).string)
    ///     // Prints "Hello world!"
    ///
    /// - Parameters:
    ///   - lhs: a NSAttributedString
    ///   - rhs: a NSAttributedString
    /// - Returns: a concatenated NSAttributedString
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(lhs)
        result.append(rhs)
        return NSAttributedString(attributedString: result)
    }
    
}
