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
    var isUppercase: Bool {
        return uppercased() == self
    }

    /// Checks whether is lowercase.
    var isLowercase: Bool {
        return lowercased() == self
    }
    
    /// Checks whether is capitalized case.
    var isCapitalized: Bool {
        return self.capitalized == self
    }
    
    /// A sentense case representation of the string.
    var sentenseCased: String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed
        return sentense.prefix(1).uppercased() + sentense.dropFirst()
    }
    
    /// A first letter capitalized representation of the string.
    var firstLetterCapitalized: String {
        return sentenseCased
    }
    
    /// Capitalizes the first letter.
    mutating func capitalizeFirstLetter() {
        self = sentenseCased
    }
    
    /// A camel case representation of the string.
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
    var snakeCased: String {
        let sentense = uppercaseLetterSeparated.lowercased().newlineSeparated.lowercased().whitespaceCondensed.newlineCondensed.underscoreCondensed.trimStart(text: "_").trimEnd(text: "_")
        return sentense.prefix(1).lowercased() + String(sentense.replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: "\n", with: "_").dropFirst()).underscoreCondensed
    }
    
    /// Changes to camel case.
    ///
    ///     let helloworld = "Hello world!"
    ///     helloworld.toSnakeCase()
    ///     print(helloworld)
    ///     // Prints "hello_world"
    ///
    mutating func toSnakeCase() {
        self = snakeCased
    }

}
