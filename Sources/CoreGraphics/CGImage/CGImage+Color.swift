//
//  CGImage+Color.swift
//  SExtensions
//
//  Created by Ray on 2019/1/25.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGImage {

    /// Returns an UIColor at a given CGPoint if possible.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 2))
    ///     view.layer.addBorder(color: .white, width: 0.5, side: .top)
    ///     print(view.layer.image?.cgImage?.colorAt(CGPoint(x: 0, y: 0))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor))
    ///     // Prints "Optional(true)"
    ///
    /// - Parameter point: A CGPoint position.
    /// - Returns: An Optional UIColor.
    func colorAt(_ point: CGPoint) -> UIColor? {
        var pixelData = [UInt8](repeating: 0, count: 4)
        guard let context = CGContext(data: &pixelData, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        context.translateBy(x: -trunc(point.x), y: trunc(point.y) - CGFloat(height) + 1)
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        let red = CGFloat(pixelData[0]) / 255.0
        let green = CGFloat(pixelData[1]) / 255.0
        let blue = CGFloat(pixelData[2]) / 255.0
        let alpha = CGFloat(pixelData[3]) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
