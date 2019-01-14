//
//  String+Case.swift
//  SExtensions
//
//  Created by Ray on 2018/5/29.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {

    /// Checks whether is uppercase.
    ///
    ///     print("HELLO WORLD!".isUppercase)
    ///     // Prints "true"
    var isUppercase: Bool {
        return uppercased() == self
    }

    /// Retunrs true if the ith character is uppercase, or nil if cannot get the
    /// character.
    ///
    ///     print("Hello World!".isUppercase(at: 0))
    ///     // Prints "Optional(true)"
    ///
    /// - Parameter i: The position.
    /// - Returns: Retunrs true if the ith character is uppercase, otherwise false.
    func isUppercase(at i: Int) -> Bool? {
        guard let character = self[safe: i] else { return nil }
        return String(character).isUppercase
    }

    /// Checks whether is lowercase.
    ///
    ///     print("hello world!".isLowercase)
    ///     // Prints "true"
    var isLowercase: Bool {
        return lowercased() == self
    }

    /// Retunrs true if the ith character is lowercase, or nil if cannot get the
    /// character.
    ///
    ///     print("Hello World!".isLowercase(at: 1))
    ///     // Prints "Optional(true)"
    ///
    /// - Parameter i: The position.
    /// - Returns: Retunrs true if the ith character is lowercase, otherwise false.
    func isLowercase(at i: Int) -> Bool? {
        guard let character = self[safe: i] else { return nil }
        return String(character).isLowercase
    }

    /// Checks whether is capitalized case.
    ///
    ///     print("Hello World!".isCapitalized)
    ///     // Prints "true"
    var isCapitalized: Bool {
        return self.capitalized == self
    }

    /// A first letter capitalized representation of the string.
    ///
    ///     print("hello world!".firstLetterCapitalized)
    ///     // Prints "Hello world!"
    var firstLetterCapitalized: String {
        return changingToSentenseCase()
    }

    /// Returns a sentense case representation of the string.
    ///
    ///     print("hello world!".changingToSentenseCase())
    ///     // Prints "Hello world!"
    ///
    /// - Returns: A sentense case string.
    func changingToSentenseCase() -> String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed
        return sentense.prefix(1).uppercased() + sentense.dropFirst()
    }

    /// Changes to sentense case.
    ///
    ///     var helloWorld = "hello world!"
    ///     helloWorld.changeToSentenseCase()
    ///     print(helloWorld)
    ///     // Prints "Hello world!"
    mutating func changeToSentenseCase() {
        self = changingToSentenseCase()
    }

    /// Returns a camel case representation of the string.
    ///
    ///     print("hello world!".changingToCamelCase())
    ///     // Prints "helloWorld!"
    ///
    /// - Returns: a camel case string.
    func changingToCamelCase() -> String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed
        return sentense.prefix(1).lowercased() + sentense.capitalized.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "").dropFirst()
    }

    /// Changes to camel case.
    ///
    ///     let helloworld = "Hello world!"
    ///     helloworld.toCamelCase()
    ///     print(helloworld)
    ///     // Prints "helloWorld"
    mutating func changeToCamelCase() {
        self = changingToCamelCase()
    }

    /// Returns a snake case representation of the string.
    ///
    ///     print("hello world!".changingToSnakeCase())
    ///     // Prints "hello_world!"
    ///
    /// - Returns: A snake case string.
    func changingToSnakeCase() -> String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed.underscoreCondensed.removingPrefix("_").removingSuffix("_")
        return sentense.prefix(1).lowercased() + String(sentense.replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: "\n", with: "_").dropFirst()).underscoreCondensed
    }

    /// Changes to camel case.
    ///
    ///     let helloworld = "Hello world!"
    ///     helloworld.toSnakeCase()
    ///     print(helloworld)
    ///     // Prints "hello_world"
    mutating func changeToSnakeCase() {
        self = changingToSnakeCase()
    }
}
