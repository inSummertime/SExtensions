//
//  Character+Case.swift
//  SExtensions
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Character {

    /// Returns true if it is uppercase
    ///
    ///     print(Character("A").isUppercase)
    ///     // Prints "true"
    var isUppercase: Bool {
        return String(self).isUppercase
    }

    /// Returns true if it is lowercase
    ///
    ///     print(Character("a").isLowercase)
    ///     // Prints "true"
    var isLowercase: Bool {
        return String(self).isLowercase
    }
}
