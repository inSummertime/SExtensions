//
//  Int+NumberOfBitOne.swift
//  SExtensions
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Returns the number of 1 it has in binary representation.
    ///
    ///     print(3.numberOfBitOne)
    ///     // Prints "2"
    var numberOfBitOne: Int {
        return String(self, radix: 2).filter{ $0 == "1" }.count
    }
    
    /// Returns the number of 0 it has in binary representation.
    ///
    ///     print(3.numberOfBitOne)
    ///     // Prints "0"
    var numberOfBitZero: Int {
        return String(self, radix: 2).filter{ $0 == "0" }.count
    }
    
}
