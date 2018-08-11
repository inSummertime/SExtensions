//
//  Calendar+Gregorian.swift
//  SExtensions
//
//  Created by Ray on 2018/8/11.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Calendar {
    
    /// Gregorian Calendar.
    static var gregorian: Calendar {
        return Calendar(identifier: Calendar.Identifier.gregorian)
    }
    
}
