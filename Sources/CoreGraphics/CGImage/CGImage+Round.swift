//
//  CGImage+Round.swift
//  SExtensions
//
//  Created by Ray on 2019/2/1.
//  Copyright © 2019 Ray. All rights reserved.
//

import Foundation

public extension CGImage {

    var round: CGImage? {
        let radius = CGFloat(min(width, height)) / 2
        let bounds = CGRect(origin: .zero, size: CGSize(width: width, height: height))
        let rect = CGRect(x: bounds.center.x - radius, y: bounds.center.y - radius, width: radius * 2.0, height: radius * 2.0)
        guard let cropped = cropping(to: rect) else { return nil }
        let newRect = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        let path = CGPath(roundedRect: newRect, cornerWidth: radius, cornerHeight: radius, transform: nil)
        guard let colorSpace = colorSpace else { return nil }
        guard let context = CGContext(data: nil, width: Int(radius * 2), height: Int(radius * 2), bitsPerComponent: bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        context.addPath(path)
        context.clip()
        context.draw(cropped, in: newRect)
        return context.makeImage()
    }
}
