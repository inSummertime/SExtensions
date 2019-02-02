//
//  CGImage+Corner.swift
//  SExtensions
//
//  Created by Ray on 2019/1/31.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGImage {

    /// Returns a new CGImage with round corners.
    ///
    /// - Parameter radius: A CGFloat value that measures how round the corner is.
    /// - Returns: A new CGImage.
    func addRoundCorners(radius: CGFloat) -> CGImage? {
        if radius == 0 { return self }
        guard let colorSpace = colorSpace else { return nil }
        guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let path = CGPath(roundedRect: rect, cornerWidth: radius, cornerHeight: radius, transform: nil)
        context.addPath(path)
        context.clip()
        context.draw(self, in: rect)
        return context.makeImage()
    }

    /// Returns a new CGImage with round corners, the radius value is the smaller one between the width and the height.
    ///
    /// - Returns: a new CGImage.
    var rounded: CGImage? {
        return addRoundCorners(radius: CGFloat(min(width, height) / 2))
    }
}
