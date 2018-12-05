//
//  Optional+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/10/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Optional where Wrapped: Numeric {

    /// Adds two values and produces their sum.
    ///
    ///     let a: Int? = nil
    ///     let b: Int? = 1
    ///     print(a + b)
    ///     // Prints "Optional(1)"
    ///
    /// - Parameters:
    ///   - lhs: The first option value to add.
    ///   - rhs: The second option value to add.
    /// - Returns: An optional value.
    static func + (lhs: Optional, rhs: Optional) -> Optional {
        if lhs == nil && rhs == nil {
            return nil
        } else {
            return (lhs ?? 0) + (rhs ?? 0)
        }
    }

    /// Subtracts one value from another and produces their difference.
    ///
    ///     let a: Int? = nil
    ///     let b: Int? = 1
    ///     print(a - b)
    ///     // Prints "Optional(-1)"
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    /// - Returns: An optional value.
    static func - (lhs: Optional, rhs: Optional) -> Optional {
        if lhs == nil && rhs == nil {
            return nil
        } else {
            return (lhs ?? 0) - (rhs ?? 0)
        }
    }

    /// Multiplies two values and produces their product.
    ///
    ///     let a: Int? = nil
    ///     let b: Int? = 1
    ///     print(a * b)
    ///     // Prints "Optional(1)"
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    /// - Returns: An optional value.
    static func * (lhs: Optional, rhs: Optional) -> Optional {
        if lhs == nil && rhs == nil {
            return nil
        } else {
            return (lhs ?? 1) * (rhs ?? 1)
        }
    }

}
