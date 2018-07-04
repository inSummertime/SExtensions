//
//  Double+Bool.swift
//  SExtensions
//
//  Created by Ray on 2018/7/4.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Checks if it means true
    var bool: Bool {
        return NSNumber(value: self) == NSNumber(value: true)
    }
    
}
