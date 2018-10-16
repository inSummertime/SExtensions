//
//  Bool+StringValue.swift
//  SExtensions
//
//  Created by Ray on 2018/10/16.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Bool {
    
    /// Returns "1" if true, otherwise "0"
    ///
    ///     print(true.stringValue)
    ///     // Prints "1"
    var stringValue: String {
        return self ? "1" : "0"
    }
    
}
