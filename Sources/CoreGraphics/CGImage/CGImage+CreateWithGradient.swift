//
//  CGImage+CreateWithGradient.swift
//  SExtensions
//
//  Created by Ray on 2019/1/27.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGImage {

    /// Returns a CGImage with given colors, whether the gradient is horizontal and size.
    ///
    /// - Parameters:
    ///   - colors: The array of UIColor defining the color of each gradient stop.
    ///   - isHorizontal: whether is horizontal
    ///   - size: The image size.
    /// - Returns: Returns a CGImage if succeeds, otherwise returns nil.
    class func createWithGradient(colors: [UIColor], isHorizontal: Bool, size: CGSize) -> CGImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        gradientLayer.startPoint = CGPoint.zero
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        guard let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 4 * Int(size.width), space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0, y: -size.height)
        gradientLayer.render(in: context)
        return context.makeImage()
    }
}
