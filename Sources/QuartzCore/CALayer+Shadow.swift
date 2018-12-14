//
//  CALayer+Shadow.swift
//  SExtensions
//
//  Created by Ray on 2018/12/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// Adds a shadow.
    ///
    /// - Parameter color: The color of the shadow. Defaults to opaque black.
    /// - Parameter offset: The shadow offset. Defaults to (0, -3).
    /// - Parameter radius: The blur radius used to create the shadow. Defaults to 3.
    /// - Parameter opacity: The opacity of the shadow. Defaults to 0.
    func addShadow(color: UIColor = UIColor.black, offset: CGSize = CGSize(width: 0, height: -3), radius: CGFloat = 3, opacity: Float = 0) {
        shadowColor = color.cgColor
        shadowOffset = offset
        shadowRadius = radius
        shadowOpacity = opacity
    }

}
