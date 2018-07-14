//
//  Bool+Toggle.swift
//  SExtensions
//
//  Created by Ray on 7/12/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Bool {
    
    /// Toggles the value.
    ///
    ///     var bool = true
    ///     bool.toggle()
    ///     print(bool)
    ///     // Prints "false"
    ///
    /// - Returns: Toggled value
    mutating func toggle() {
        self = !self
    }
    
}
