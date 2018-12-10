//
//  String+Separate.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {

    /// A uppercase letter separated string.
    ///
    ///     print("helloWorld!".uppercaseLetterSeparated)
    ///     // Prints "hello World!"
    var uppercaseLetterSeparated: String {
        return separating(by: .uppercaseLetters)
    }

    /// A newline separated string.
    ///
    ///     print("hello\nworld!".newlineSeparated)
    ///     // Prints "hello world!"
    var newlineSeparated: String {
        return separating(by: "\n")
    }

    /// Returns a string separated by a text.
    ///
    ///     print("helloWorld".separate(by: "W"))
    ///     // Prints "hello World"
    ///
    /// - Parameter text: a text that separates by.
    /// - Returns: a separated string.
    func separating(by text: String) -> String {
        let separated = trimmed.unicodeScalars.reduce("") { (accumulation: String, next: Unicode.Scalar) -> String in
            if String(next) == text {
                return accumulation + " \(String(next))"
            } else {
                return accumulation + String(next)
            }
        }
        return separated
    }

    /// Returns a string separated by a character set.
    ///
    ///     print("hello-world".separate(by: .punctuationCharacters))
    ///     // Prints "hello -world"
    ///
    /// - Parameter characterSet: a character set that separates by.
    /// - Returns: a separated string.
    func separating(by characterSet: CharacterSet) -> String {
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
