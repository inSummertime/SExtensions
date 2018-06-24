//
//  Array+SafeSubscript.swift
//  SExtensions
//
//  Created by Ray on 2018/6/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array {
    
    /// Returns the element if it is within bounds
    ///
    /// - Parameter index: the specified index
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
