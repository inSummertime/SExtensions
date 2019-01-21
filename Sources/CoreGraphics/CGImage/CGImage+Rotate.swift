//
//  CGImage+Rotate.swift
//  SExtensions
//
//  Created by Ray on 2019/1/20.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGImage {
    
    /// Rotates a CGImage.
    ///
    /// - Parameter degrees: The degrees to rotate. Positive values rotate counterclockwise and negative values rotate clockwise.
    /// - Returns: A CGImage.
    func rotate(degrees: CGFloat) -> CGImage? {
        let radians = CGFloat.radiansFromDegrees(degrees)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let rotatedRect = rect.applying(CGAffineTransform(rotationAngle: radians))
        let newWidth = rotatedRect.size.width
        let newHeight = rotatedRect.size.height
        guard let colorSpace = colorSpace else { return nil }
        guard let context = CGContext(data: nil, width: Int(newWidth), height: Int(newHeight), bitsPerComponent: bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        // Move the origin to the middle so it will rotate around the center.
        context.translateBy(x: newWidth / 2, y: newHeight / 2)
        context.rotate(by: radians)
        context.translateBy(x: -newWidth / 2, y: -newHeight / 2)
        context.draw(self, in: CGRect(x: (newWidth - CGFloat(width)) / 2, y: (newHeight - CGFloat(height)) / 2, width: CGFloat(width), height: CGFloat(height)))
        return context.makeImage()
    }
}
