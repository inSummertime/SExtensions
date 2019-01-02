//
//  CALayer+Shadow.swift
//  SExtensions
//
//  Created by Ray on 2018/12/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics
import QuartzCore
import UIKit

public extension CALayer {

    /// Adds a shadow.
    ///
    /// - Parameter color: The color of the shadow. Defaults to opaque black.
    /// - Parameter radius: The blur radius used to create the shadow. Defaults to 3.
    /// - Parameter offset: The shadow offset. Defaults to (0, -3).
    /// - Parameter opacity: The opacity of the shadow. Defaults to 0.5.
    func addShadow(radius: CGFloat = 3, color: UIColor = UIColor.black, offset: CGSize = CGSize(width: 0, height: -3), opacity: Float = 0.5) {
        shadowRadius = radius
        shadowColor = color.cgColor
        shadowOffset = offset
        shadowOpacity = opacity
    }
    
    /// Adds a round shadow.
    ///
    /// - Parameters:
    ///   - radius: The blur radius used to create the shadow. Defaults to 3.
    ///   - color: The color of the shadow. Defaults to opaque black.
    ///   - offset: The shadow offset. Defaults to (0, -3).
    ///   - opacity: The opacity of the shadow. Defaults to 0.5.
    func addRoundShadow(radius: CGFloat = 3, color: UIColor = UIColor.black, offset: CGSize = CGSize(width: 0, height: -3), opacity: Float = 0.5) {
        addShadow(radius: radius, color: color, offset: offset, opacity: opacity)
        cornerRadius = radius
        shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

}
