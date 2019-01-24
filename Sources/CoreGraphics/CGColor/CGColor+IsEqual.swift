//
//  CGColor+IsEqual.swift
//  SExtensions
//
//  Created by Ray on 2019/1/24.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGColor {

    /// Returns true if self is equal to another CGColor with different color space.
    ///
    ///     let clearColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
    ///     print(clearColor.isEqualWithConversion(to: UIColor.clear.cgColor))
    ///     // Prints "true"
    ///
    /// - Parameter other: Another CGColor.
    /// - Returns: Returns `true` if self is the same color as another CGColor with different color space; otherwise returns `false`.
    func isEqualWithConversion(to other: CGColor) -> Bool {
        guard let space = colorSpace else { return false }
        guard let converted = other.converted(to: space, intent: .defaultIntent, options: nil) else { return false }
        return self == converted
    }
}
