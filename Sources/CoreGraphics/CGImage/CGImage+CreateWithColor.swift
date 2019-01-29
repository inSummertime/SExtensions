//
//  CGImage+CreateWithColor.swift
//  SExtensions
//
//  Created by Ray on 2019/1/28.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGImage {

    /// Returns a CGImage with given a color and size.
    ///
    /// - Parameters:
    ///   - color: A UIColor.
    ///   - size: The Image size.
    /// - Returns: Returns a CGImage if succeeds, otherwise returns nil.
    class func createWithColor(_ color: UIColor, size: CGSize) -> CGImage? {
        let layer = CALayer()
        layer.backgroundColor = color.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        guard let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 4 * Int(size.width), space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        layer.render(in: context)
        return context.makeImage()
    }
}
