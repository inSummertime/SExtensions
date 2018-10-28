//
//  Int+Reversed.swift
//  SExtensions
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Int {
    
    var reversed: Int? {
        let sign = self < 0 ? -1 : 1
        let text = String(String(self * sign).reversed())
        return Int(text) * sign
    }
    
}
