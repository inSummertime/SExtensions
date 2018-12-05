//
//  UserDefaults+Subscript.swift
//  SExtensions
//
//  Created by Ray on 2018/8/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension UserDefaults {

    /// Searches the receiver's search list for a default with the
    /// key and return it using subscript.
    ///
    ///     UserDefaults.standard.set(true, forKey: "HelloWorld!")
    ///     print(UserDefaults.standard["HelloWorld!"])
    ///     // Prints "Optional(1)"
    ///
    /// - Parameter key: The key to search with.
    subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }

}
