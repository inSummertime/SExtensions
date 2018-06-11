//
//  String+Alphanumeric.swift
//  SExtensions
//
//  Created by Ray on 2018/6/5.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// Returns true if it is alphanumeric.
    ///
    ///     print("helloworld2".isAlphanumeric)
    ///     // Prints "true"
    var isAlphanumeric: Bool {
        let count = components(separatedBy: .alphanumerics).joined(separator: "").count
        return hasLetters && hasNumbers && count == 0
    }
    
    /// Returns true if it has letters and numbers.
    ///
    ///     print("Hello world! 2".hasLettersAndNumbers)
    ///     // Prints "true"
    var hasLettersAndNumbers: Bool {
        return hasLetters && hasNumbers
    }
    
    /// Returns true if it has letters.
    ///
    ///     print("Hello world!".hasLetters)
    ///     // Prints "true"
    var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: [], range: nil) != nil
    }
    
    /// Returns true if it has letters only.
    ///
    ///     print("helloworld".hasLettersOnly)
    ///     // Prints "true"
    var hasLettersOnly: Bool {
        let count = components(separatedBy: .letters).joined(separator: "").count
        return hasLetters && count == 0
    }
    
    /// Returns true if it has numbers.
    ///
    ///     print("helloworld2".hasNumbers)
    ///     // Prints "true"
    var hasNumbers: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: [], range: nil) != nil
    }
    
    /// Returns true if it has numbers only.
    ///
    ///     print("0".hasNumbersOnly)
    ///     // Prints "true"
    var hasNumbersOnly: Bool {
        let count = components(separatedBy: .decimalDigits).joined(separator: "").count
        return hasNumbers && count == 0
    }
    
}
