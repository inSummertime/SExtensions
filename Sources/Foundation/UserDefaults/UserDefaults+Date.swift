//
//  UserDefaults+Date.swift
//  SExtensions
//
//  Created by Ray on 2018/8/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension UserDefaults {

    /// Searches the receiver's search list for a default with
    /// the key 'defaultName' and converts the returned value to a
    /// Date and returns nil if the value is not a Date.
    ///
    ///     UserDefaults.standard.set(Date(timeIntervalSinceReferenceDate: 0), forKey: "HelloWorld!")
    ///     print(UserDefaults.standard.date(forKey: "HelloWorld!")! == Date(timeIntervalSinceReferenceDate: 0))
    ///     // Prints "true"
    ///
    /// - Parameter defaultName: The key to search with.
    /// - Returns: A date or nil
    func date(forKey defaultName: String) -> Date? {
        return object(forKey: defaultName) as? Date
    }

}
