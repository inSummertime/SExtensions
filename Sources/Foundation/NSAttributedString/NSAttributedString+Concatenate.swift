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
    ///   - lhs: A NSAttributedString.
    ///   - rhs: Another NSAttributedString.
    /// - Returns: A concatenated NSAttributedString.
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(lhs)
        result.append(rhs)
        return NSAttributedString(attributedString: result)
    }

    /// Adds two NSAttributedStrings and stores the result in the left-hand-side.
    ///
    ///     var hello = NSAttributedString(string: "Hello")
    ///     let world = NSAttributedString(string: " world!")
    ///     hello += world
    ///     print(hello.string)
    ///     // Prints "Hello world!"
    ///
    /// - Parameters:
    ///   - lhs: The first NSAttributedString to add.
    ///   - rhs: The second NSAttributedString to add.
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let result = NSMutableAttributedString(attributedString: lhs)
        result.append(rhs)
        lhs = result
    }
}
