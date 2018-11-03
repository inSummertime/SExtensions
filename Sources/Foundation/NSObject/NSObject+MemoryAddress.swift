//
//  NSObject+MemoryAddress.swift
//  SExtensions
//
//  Created by Ray on 2018/10/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension NSObject {
    
    /// The memory address of the pointer of a NSObject.
    var memoryAddress: String {
        return String(format: "%p", self)
    }
    
}
