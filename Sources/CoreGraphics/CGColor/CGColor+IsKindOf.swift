//
//  CGColor+IsKindOf.swift
//  SExtensions
//
//  Created by Ray on 2019/1/26.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGColor {

    /// Returns true if self has the same component values as another CGColor with a given maximum fraction digits for the comparison.
    ///
    ///     let white = UIColor(red: 0.994, green: 0.994, blue: 0.994, alpha: 1).cgColor
    ///     print(white.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 1))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - aColor: Another CGColor.
    ///   - maximumFractionDigits: Maximum fraction digits for the comparison.
    /// - Returns: Returns `true` when the component values match, otherwise returns `false`.
    func isKind(of aColor: CGColor, maximumFractionDigits: Int) -> Bool {
        guard maximumFractionDigits >= 0 else { return false }
        // guard let space = colorSpace else { return false }

        guard let converted = converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil) else { return false }
        guard let convertedAColor = aColor.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil) else { return false }
        for index in 0 ..< converted.numberOfComponents {
            if let component = converted.components?[index] {
                if let component2 = convertedAColor.components?[index] {
                    if Double(component).round(to: maximumFractionDigits) != Double(component2).round(to: maximumFractionDigits) {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return true
    }
}
