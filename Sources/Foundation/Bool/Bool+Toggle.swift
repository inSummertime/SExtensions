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
    ///     bool.toggleValue()
    ///     print(bool)
    ///     // Prints "false"
    ///
    /// - Returns: The toggled value.
    mutating func toggleValue() {
        self = !self
    }
    
}
