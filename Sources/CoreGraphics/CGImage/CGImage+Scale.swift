//
//  CGImage+Scale.swift
//  SExtensions
//
//  Created by Ray on 2019/1/22.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGImage {

    func scaleBy(_ s: CGFloat) -> CGImage? {
        guard s > 0 else { return nil }
        guard let colorSpace = colorSpace else { return nil }
        let newWidth = CGFloat(width) * s
        let newHeight = CGFloat(height) * s
        guard let context = CGContext(data: nil, width: Int(newWidth), height: Int(newHeight), bitsPerComponent: bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        context.scaleBy(x: s, y: s)
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return context.makeImage()
    }
}
