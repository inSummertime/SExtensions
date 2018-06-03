//
//  String+Bool.swift
//  SExtensions
//
//  Created by Ray on 2018/5/28.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// Optional bool value
    ///
    ///     print("yes".bool)
    ///     // Prints Optional(true)
    var bool: Bool? {
        if ["true", "yes", "1", "one"].contains(lowercased().trimmed) {
            return true
        } else if ["false", "no", "0", "zero"].contains(lowercased().trimmed) {
            return false
        } else {
            return nil
        }
    }
    
}
