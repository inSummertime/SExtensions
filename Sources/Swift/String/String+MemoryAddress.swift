//
//  String+MemoryAddress.swift
//  SExtensions
//
//  Created by Ray on 2018/10/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

extension String {

    /// Returns the memory address of an object.
    ///
    /// - Parameter object: AnyObject or nil.
    /// - Returns: A String.
    static func memoryAddress(of object: AnyObject?) -> String {
        guard let object = object else { return "nil" }
        let opaque: UnsafeMutableRawPointer = Unmanaged.passUnretained(object).toOpaque()
        return String(describing: opaque)
    }

}
