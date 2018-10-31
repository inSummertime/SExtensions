//
//  NSObject+MemoryAddress.swift
//  SExtensions
//
//  Created by Jerry on 2018/10/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

extension NSObject {
    
    var memoryAddress: String {
        return String(format: "%p", self)
    }
}
