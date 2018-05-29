//
//  String+Case.swift
//  SExtensions
//
//  Created by Ray on 2018/5/29.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

extension String {
    
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
        return trimmed.prefix(1).uppercased() + trimmed.dropFirst()
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
        return trimmed.prefix(1).lowercased() + trimmed.capitalized.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "").dropFirst()
    }
    
    /// Changes to camel case
    mutating func toCamelCase() {
        self = camelCased
    }

}
