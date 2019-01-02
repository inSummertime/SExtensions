//
//  CALayer+TransparentCircle.swift
//  SExtensions
//
//  Created by Ray on 2018/12/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics
import QuartzCore
import UIKit

public extension CALayer {

    /// Adds a transparent circle overlay.
    ///
    /// - Parameters:
    ///   - center: The center of the circle.
    ///   - radius: The radius of the circle.
    ///   - overlayColor: overlay color.
    ///   - overlayAlpha: overlay alpha.
    /// - Returns: A CALayer.
    @discardableResult
    func addTransparentCircle(center: CGPoint, radius: CGFloat, overlayColor: UIColor = .black, overlayAlpha: CGFloat = 0.5) -> CALayer {
        let path = CGMutablePath()
        path.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: false)
        path.addRect(CGRect(origin: .zero, size: frame.size))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillRule = kCAFillRuleEvenOdd

        let overLayer = CALayer()
        overLayer.frame = bounds
        overLayer.backgroundColor = overlayColor.withAlphaComponent(overlayAlpha).cgColor
        overLayer.mask = shapeLayer
        addSublayer(overLayer)
        return overLayer
    }

}
