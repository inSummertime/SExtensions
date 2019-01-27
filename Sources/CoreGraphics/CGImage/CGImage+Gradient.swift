//
//  CGImage+Gradient.swift
//  SExtensions
//
//  Created by Ray on 2019/1/27.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGImage {

    /// Returns a CGImage with given size, colors and whether the gradient is horizontal.
    ///
    /// - Parameters:
    ///   - size: Image size.
    ///   - colors: The array of UIColor defining the color of each gradient stop.
    ///   - isHorizontal: whether is horizontal
    /// - Returns: Returns a CGImage if succeeds, otherwise returns nil.
    class func createWithGradient(size: CGSize, colors: [UIColor], isHorizontal: Bool) -> CGImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        gradientLayer.startPoint = CGPoint.zero
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        gradientLayer.render(in: context)
        return context.makeImage()
    }
}
