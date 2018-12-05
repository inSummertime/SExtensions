//
//  Int+Padded.swift
//  SExtensions
//
//  Created by Ray on 2018/9/13.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Int {

    /// Returns a padded string with the given field width.
    ///
    ///     print(1.padded(fieldWidth: 10) == "0000000001")
    ///     // Prints "true"
    ///
    /// - Parameter fieldWidth: Field width.
    /// - Returns: A string.
    func padded(fieldWidth: Int) -> String {
        return String(format: "%0*d", fieldWidth, self)
    }

}
