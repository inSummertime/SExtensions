//
//  String+Separate.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

extension String {
    
    /// A uppercase letter separated string.
    var uppercaseLetterSeparated: String {
        return separate(by: .uppercaseLetters)
    }
    
    /// A newline separated string.
    var newlineSeparated: String {
        return separate(by: "\n")
    }
    
    /// Separates a string by a text into a new string
    ///
    /// - Parameter text: a text that separates by
    /// - Returns: a separated string
    func separate(by text: String) -> String {
        let separated = trimmed.unicodeScalars.reduce("") { (accumulation: String, next: Unicode.Scalar) -> String in
            if String(next) == text {
                return accumulation + " \(String(next))"
            } else {
                return accumulation + String(next)
            }
        }
        return separated
    }
    
    /// Separates a string by a character set into a new string
    ///
    /// - Parameter characterSet: a character set that separates by
    /// - Returns: a separated string
    func separate(by characterSet: CharacterSet) -> String {
        let separated = trimmed.unicodeScalars.reduce("") { (accumulation: String, next: Unicode.Scalar) -> String in
            if characterSet.contains(next) {
                return accumulation + " \(String(next))"
            } else {
                return accumulation + String(next)
            }
        }
        return separated
    }
    
}
