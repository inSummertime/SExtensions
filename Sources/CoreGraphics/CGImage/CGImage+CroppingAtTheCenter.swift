//
//  CGImage+CroppingAtTheCenter.swift
//  SExtensions
//
//  Created by Ray on 2019/2/4.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGImage {

    /// Creates an image using the data contained within the CGSize at the center.
    ///
    /// - Parameter size: The size of the new CGImage, if width or height is bigger than original, it uses the original.
    /// - Returns: An CGImage, or nil when the resulting rectangle is the null rectangle.
    func croppingAtTheCenter(to size: CGSize) -> CGImage? {
        let bounds = CGRect(origin: .zero, size: CGSize(width: width, height: height))
        let rect = CGRect(x: bounds.center.x - size.width / 2, y: bounds.center.y - size.height / 2, width: size.width, height: size.height)
        return cropping(to: rect)
    }
}
