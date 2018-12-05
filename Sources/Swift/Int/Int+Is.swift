//
//  Int+Is.swift
//  SExtensions
//
//  Created by Ray on 2018/8/14.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Int {

    /// Returns true if it is an even number
    var isEven: Bool {
        return self % 2 == 0
    }

    /// Returns true if it is an odd number
    var isOdd: Bool {
        return self % 2 == 1
    }

    var isPrime: Bool {
        if self == 1 || self == 2 || self == 3 { return true }
        let maxDivider = Int(ceil(sqrt(Double(self))))
        return !(2...maxDivider).contains { self % $0 == 0 }
    }

}
