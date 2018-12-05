//
//  Int+Bool.swift
//  SExtensions
//
//  Created by Ray on 7/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Int {

    /// Checks if it means true
    ///
    ///     print(1.bool)
    ///     // Prints "true"
    var bool: Bool {
        return NSNumber(value: self) == NSNumber(value: true)
    }

}
