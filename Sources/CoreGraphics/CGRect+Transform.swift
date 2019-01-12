//
//  CGRect+Transform.swift
//  SExtensions
//
//  Created by Ray on 2018/9/11.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics

public extension CGRect {

    /// Returns a new scaled CGRect from the center ancer point.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
    ///     let scaledRect = rect.transformFromCenter(scaleX: 0.5, scaleY: 0.25)
    ///     print(scaledRect == CGRect(x: 0.25, y: 0.75, width: 0.5, height: 0.5))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - scaleX: Scale x.
    ///   - scaleY: Scale y.
    /// - Returns: A new CGRect.
    func transformFromCenter(scaleX: CGFloat, scaleY: CGFloat) -> CGRect {
        guard scaleX > 0 && scaleY > 0 else { return self }
        let newWidth = width * scaleX
        let newHeight = height * scaleY
        let newX = (width - newWidth) / 2.0
        let newY = (height - newHeight) / 2.0
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }

    /// Returns a new scaled CGRect from the top left ancer point.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
    ///     let scaledRect = rect.transformFromTopLeft(scaleX: 2.0, scaleY: 1.0)
    ///     print(scaledRect == CGRect(x: 0, y: 0, width: 2.0, height: 2.0))
    ///
    /// - Parameters:
    ///   - scaleX: Scale x.
    ///   - scaleY: Scale y.
    /// - Returns: A new CGRect.
    func transformFromTopLeft(scaleX: CGFloat, scaleY: CGFloat) -> CGRect {
        guard scaleX > 0 && scaleY > 0 else { return self }
        let newWidth = width * scaleX
        let newHeight = height * scaleY
        return CGRect(x: origin.x, y: origin.y, width: newWidth, height: newHeight)
    }

    /// Returns a new scaled CGRect from the top right ancer point.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
    ///     let scaledRect = rect.transformFromTopRight(scaleX: 2.0, scaleY: 1.0)
    ///     print(scaledRect == CGRect(x: -1.0, y: 0, width: 2.0, height: 2.0))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - scaleX: Scale x.
    ///   - scaleY: Scale y.
    /// - Returns: A new CGRect.
    func transformFromTopRight(scaleX: CGFloat, scaleY: CGFloat) -> CGRect {
        guard scaleX > 0 && scaleY > 0 else { return self }
        let newWidth = width * scaleX
        let newHeight = height * scaleY
        let newX = origin.x + (1 - scaleX) * width
        return CGRect(x: newX, y: origin.y, width: newWidth, height: newHeight)
    }

    /// Returns a new scaled CGRect from the bottom left ancer point.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
    ///     let scaledRect = rect.transformFromBottomLeft(scaleX: 2.0, scaleY: 2.0)
    ///     print(scaledRect == CGRect(x: 0, y: -2.0, width: 2.0, height: 4.0))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - scaleX: Scale x.
    ///   - scaleY: Scale y.
    /// - Returns: A new CGRect.
    func transformFromBottomLeft(scaleX: CGFloat, scaleY: CGFloat) -> CGRect {
        guard scaleX > 0 && scaleY > 0 else { return self }
        let newWidth = width * scaleX
        let newHeight = height * scaleY
        let newY = origin.y + (1 - scaleY) * height
        return CGRect(x: origin.x, y: newY, width: newWidth, height: newHeight)
    }

    /// Returns a new scaled CGRect from the bottom right ancer point.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
    ///     let scaledRect = rect.transformFromBottomRight(scaleX: 2.0, scaleY: 2.0)
    ///     print(scaledRect == CGRect(x: -1.0, y: -2.0, width: 2.0, height: 4.0))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - scaleX: Scale x.
    ///   - scaleY: Scale y.
    /// - Returns: A new CGRect.
    func transformFromBottomRight(scaleX: CGFloat, scaleY: CGFloat) -> CGRect {
        guard scaleX > 0 && scaleY > 0 else { return self }
        let newWidth = width * scaleX
        let newHeight = height * scaleY
        let newX = origin.x + (1 - scaleX) * width
        let newY = origin.y + (1 - scaleY) * height
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }

    /// Returns a new translated CGRect.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
    ///     let translatedRect = rect.transformTranslate(tx: 2.0, ty: 2.0)
    ///     print(translatedRect == CGRect(x: 2.0, y: 2.0, width: 1.0, height: 2.0))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - tx: The distance x.
    ///   - ty: The distance y.
    /// - Returns: A new CGRect.
    func transformTranslate(tx: CGFloat, ty: CGFloat) -> CGRect {
        return CGRect(x: origin.x + tx, y: origin.y + ty, width: width, height: height)
    }

}
