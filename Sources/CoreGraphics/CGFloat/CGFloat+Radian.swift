//
//  CGFloat+Radian.swift
//  SExtensions
//
//  Created by Ray on 2019/1/20.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGFloat {

    /// Returns radians from degrees.
    ///
    /// - Parameter degrees: Degrees.
    /// - Returns: A CGFloat.
    static func radiansFromDegrees(_ degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat.pi / 180
    }

    /// Returns degrees from radians.
    ///
    /// - Parameter radians: Radians.
    /// - Returns: A CGFloat.
    static func degreesFromRadians(_ radians: CGFloat) -> CGFloat {
        return radians * 180 / CGFloat.pi
    }
}
