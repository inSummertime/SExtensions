//
//  String+Case.swift
//  SExtensions
//
//  Created by Ray on 2018/5/29.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// Checks whether is uppercase.
    ///
    ///     print("HELLO WORLD!".isUppercase)
    ///     // Prints true
    var isUppercase: Bool {
        return uppercased() == self
    }

    /// Checks whether is lowercase.
    ///
    ///     print("hello world!".isLowercase)
    ///     // Prints true
    var isLowercase: Bool {
        return lowercased() == self
    }
    
    /// Checks whether is capitalized case.
    ///
    ///     print("Hello World!".isCapitalized)
    ///     // Prints true
    var isCapitalized: Bool {
        return self.capitalized == self
    }
    
    /// A sentense case representation of the string.
    ///
    ///     print("hello world!".sentenseCased)
    ///     // Prints "Hello world!"
    var sentenseCased: String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed
        return sentense.prefix(1).uppercased() + sentense.dropFirst()
    }
    
    /// A first letter capitalized representation of the string.
    ///
    ///     print("hello world!".sentenseCased)
    ///     // Prints "Hello world!"
    var firstLetterCapitalized: String {
        return sentenseCased
    }
    
    /// Capitalizes the first letter.
    ///
    ///     var helloWorld = "hello world!"
    ///     helloWorld.capitalizeFirstLetter()
    ///     print(helloWorld.capitalizeFirstLetter)
    ///     // Prints "Hello world!"
    mutating func capitalizeFirstLetter() {
        self = sentenseCased
    }
    
    /// A camel case representation of the string.
    ///
    ///     print("hello world!".camelCased)
    ///     // Prints "helloWorld!"
    var camelCased: String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed
        return sentense.prefix(1).lowercased() + sentense.capitalized.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "").dropFirst()
    }
    
    /// Changes to camel case.
    ///
    ///     let helloworld = "Hello world!"
    ///     helloworld.toCamelCase()
    ///     print(helloworld)
    ///     // Prints "helloWorld"
    ///
    mutating func toCamelCase() {
        self = camelCased
    }
    
    /// A snake case representation of the string.
    ///
    ///     print("hello world!".snakeCased)
    ///     // Prints "hello_world!"
    var snakeCased: String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed.underscoreCondensed.trimmingStart(text: "_").trimmingEnd(text: "_")
        return sentense.prefix(1).lowercased() + String(sentense.replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: "\n", with: "_").dropFirst()).underscoreCondensed
    }
    
    /// Changes to camel case.
    ///
    ///     let helloworld = "Hello world!"
    ///     helloworld.toSnakeCase()
    ///     print(helloworld)
    ///     // Prints "hello_world"
    mutating func toSnakeCase() {
        self = snakeCased
    }

}
