//
//  Bool+IntValue.swift
//  SExtensions
//
//  Created by Ray on 7/11/18.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Bool {

    /// Returns 1 if true, otherwise 0
    ///
    ///     print(true.intValue)
    ///     // Prints "1"
    var intValue: Int {
        return self ? 1 : 0
    }
}
