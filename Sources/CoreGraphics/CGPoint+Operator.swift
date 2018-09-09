//
//  CGPoint+Operator.swift
//  SExtensions
//
//  Created by Ray on 2018/9/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics

public extension CGPoint {
    
    /// Adds two CGPoint.
    ///
    ///     let point = CGPoint(x: 1.0, y: 2.0)
    ///     let anotherPoint = CGPoint(x: 3.0, y: 4.0)
    ///     let result = point + anotherPoint
    ///     print(result.x == 4.0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: The first CGPoint to add.
    ///   - rhs: The second CGPoint to add.
    /// - Returns: A new CGPoint.
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// Adds two CGPoint and stores the result in the left-hand-side
    /// variable.
    ///
    ///     var point = CGPoint(x: 1.0, y: 2.0)
    ///     point += CGPoint(x: 3.0, y: 4.0)
    ///     print(point.x == 4.0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: The first CGPoint to add.
    ///   - rhs: The second CGPoint to add.
    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// Subtracts the second value from the first.
    ///
    ///     let point = CGPoint(x: 1.0, y: 2.0)
    ///     let anotherPoint = CGPoint(x: 3.0, y: 4.0)
    ///     let result = point - anotherPoint
    ///     print(result.x == -2.0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: The first CGPoint.
    ///   - rhs: The CGPoint to subtract.
    /// - Returns: A new CGPoint.
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    /// Subtracts the second CGPoint from the first and stores the
    /// result in the left-hand-side variable.
    ///
    ///     var point = CGPoint(x: 1.0, y: 2.0)
    ///     point -= CGPoint(x: 3.0, y: 4.0)
    ///     print(point.x == -2.0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - lhs: The first CGPoint.
    ///   - rhs: The CGPoint to subtract.
    static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
}
