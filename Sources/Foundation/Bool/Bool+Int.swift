//
//  Bool+Int.swift
//  SExtensions
//
//  Created by Ray on 7/11/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Bool {
    
    /// Returns 1 if true, otherwise 0
    ///
    ///     print(true.int)
    ///     // Prints "1"
    var int: Int {
        return self ? 1 : 0
    }
    
}
