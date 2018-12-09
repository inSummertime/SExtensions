//
//  CGRect+Update.swift
//  SExtensions
//
//  Created by Ray on 2018/9/10.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics

public extension CGRect {

    /// Returns a new CGRect with its origin x updated with the given
    /// value.
    ///
    ///     let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     let newRect = rect.updating(x: 2.0)
    ///     print(newRect == CGRect(x: 2.0, y: 1.0, width: 1.0, height: 1.0))
    ///     // Prints "true"
    ///
    /// - Parameter x: New origin x.
    /// - Returns: Returns a new CGRect.
    func updating(x: CGFloat) -> CGRect {
        return CGRect(x: x, y: origin.y, width: size.width, height: size.height)
    }

    /// Updates its origin x.
    ///
    ///     var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     rect.update(x: 2.0)
    ///     print(rect == CGRect(x: 2.0, y: 1.0, width: 1.0, height: 1.0))
    ///     // Prints "true"
    ///
    /// - Parameter x: New origin x.
    mutating func update(x: CGFloat) {
        self = updating(x: x)
    }

    /// Returns a new CGRect with its origin y updated with the given
    /// value.
    ///
    ///     let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     let newRect = rect.updating(y: 2.0)
    ///     print(newRect == CGRect(x: 1.0, y: 2.0, width: 1.0, height: 1.0))
    ///     // Prints "true"
    ///
    /// - Parameter y: New origin y.
    /// - Returns: Returns a new CGRect.
    func updating(y: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: y, width: size.width, height: size.height)
    }

    /// Updates its origin y.
    ///
    ///     var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     rect.update(y: 2.0)
    ///     prints(rect == CGRect(x: 1.0, y: 2.0, width: 1.0, height: 1.0))
    ///     // Prints "true"
    ///
    /// - Parameter y: New origin y.
    mutating func update(y: CGFloat) {
        self = updating(y: y)
    }

    /// Returns a new CGRect with its width updated with the given value.
    ///
    ///     let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     let newRect = rect.updating(width: 2.0)
    ///     print(newRect == CGRect(x: 1.0, y: 1.0, width: 2.0, height: 1.0))
    ///     // Prints "true"
    ///
    /// - Parameter width: New width.
    /// - Returns: Returns a new CGRect.
    func updating(width: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: origin.y, width: width, height: size.height)
    }

    /// Updates its width.
    ///
    ///     var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     rect.update(width: 2.0)
    ///     print(rect == CGRect(x: 1.0, y: 1.0, width: 2.0, height: 1.0))
    ///     // Prints "true"
    ///
    /// - Parameter width: New width.
    mutating func update(width: CGFloat) {
        self = updating(width: width)
    }

    /// Returns a new CGRect with its height updated with the given
    /// value.
    ///
    ///     let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     let newRect = rect.updating(height: 2.0)
    ///     prints(newRect == CGRect(x: 1.0, y: 1.0, width: 1.0, height: 2.0))
    ///     // Prints "true"
    ///
    /// - Parameter height: New height.
    /// - Returns: Returns a new CGRect.
    func updating(height: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: origin.y, width: size.width, height: height)
    }

    /// Updates its height.
    ///
    ///     var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
    ///     rect.update(height: 2.0)
    ///     print(rect == CGRect(x: 1.0, y: 1.0, width: 1.0, height: 2.0))
    ///     // Prints "true"
    ///
    /// - Parameter height: New height.
    mutating func update(height: CGFloat) {
        self = updating(height: height)
    }





}



