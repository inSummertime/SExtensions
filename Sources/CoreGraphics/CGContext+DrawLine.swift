//
//  CGContext+DrawLine.swift
//  SExtensions
//
//  Created by Ray on 2019/1/13.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import UIKit

public extension CGContext {

    /// Draws a line with an array of the points.
    ///
    /// - Parameters:
    ///   - points: An array of CGPoint.
    ///   - color: The color of the line.
    ///   - lineWidth: The line width.
    func drawLine(points: [CGPoint], color: UIColor, lineWidth: CGFloat) {
        addLines(between: points)
        setStrokeColor(color.cgColor)
        setLineWidth(lineWidth)
        strokePath()
    }
}
