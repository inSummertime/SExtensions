//
//  CGImage+Orientate.swift
//  SExtensions
//
//  Created by Ray on 2019/1/18.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGImage {
    
    /// Orientates a CGImage.
    ///
    /// - Parameter orientation: A CGImagePropertyOrientation value.
    /// - Returns: An optional CGImage.
    func orientate(_ orientation: CGImagePropertyOrientation) -> CGImage? {
        var degreesToRotate: CGFloat = 0
        var swapWidthHeight: Bool = false
        var mirrored: Bool = false
        switch orientation {
        case .up:
            // The original pixel data matches the image's intended display orientation.
            return copy()
        case .right:
            // The image has been rotated 90° clockwise from the orientation of its original pixel data.
            degreesToRotate = 90.0
            swapWidthHeight = true
        case .down:
            // The image has been rotated 180° from the orientation of its original pixel data.
            degreesToRotate = 180.0
        case .left:
            // The image has been rotated 90° counterclockwise from the orientation of its original pixel data.
            degreesToRotate = -90.0
            swapWidthHeight = true
        case .upMirrored:
            // The image has been horizontally flipped from the orientation of its original pixel data.
            mirrored = true
        case .rightMirrored:
            // The encoded image data is horizontally flipped and rotated 90° clockwise from the image's intended display orientation.
            degreesToRotate = 90.0
            swapWidthHeight = true
            mirrored = true
        case .downMirrored:
            // The image has been vertically flipped from the orientation of its original pixel data.
            degreesToRotate = 180.0
            mirrored = true
        case .leftMirrored:
            // The image has been rotated 90° clockwise and flipped horizontally from the orientation of its original pixel data.
            degreesToRotate = -90.0
            swapWidthHeight = true
            mirrored = true
        }
        let radians = degreesToRotate * CGFloat.pi / 180
        var newWidth = CGFloat(width)
        var newHeight = CGFloat(height)
        if swapWidthHeight {
            newWidth = CGFloat(height)
            newHeight = CGFloat(width)
        }
        guard let colorSpace = colorSpace else { return nil }
        guard let context = CGContext(data: nil, width: Int(newWidth), height: Int(newHeight), bitsPerComponent: bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        context.translateBy(x: newWidth / 2.0, y: newHeight / 2.0)
        if mirrored {
            context.scaleBy(x: -1.0, y: 1.0)
            context.rotate(by: radians)
        } else {
            context.rotate(by: -radians)
        }
        if swapWidthHeight {
            context.translateBy(x: -newHeight / 2.0, y: -newWidth / 2.0)
        } else {
            context.translateBy(x: -newWidth / 2.0, y: -newHeight / 2.0)
        }
        context.draw(self, in: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        return context.makeImage()
    }
}
