//
//  CALayer+ColorGradient.swift
//  SExtensions
//
//  Created by Ray on 2018/11/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics
import QuartzCore
import UIKit

public extension CALayer {

    /// Adds color gradient.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    ///     view.layer.addColorGradient(startColor: .white, endColor: .black)
    ///     let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
    ///     print(gradientLayer!.bounds == view.bounds)
    ///     // Prints "true"
    ///     print(gradientLayer!.colors?.first as! CGColor == UIColor.white.cgColor)
    ///     // Prints "true"
    ///     print(gradientLayer!.colors?.last as! CGColor == UIColor.black.cgColor)
    ///     // Prints "true"
    ///     print(gradientLayer!.startPoint.x == 0.0)
    ///     // Prints "true"
    ///     print(gradientLayer!.startPoint.y == 0.0)
    ///     // Prints "true"
    ///     print(gradientLayer!.endPoint.x == 1.0)
    ///     // Prints "true"
    ///     print(gradientLayer!.endPoint.y == 0.0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - colors: Gradient UIColor array.
    ///   - isHorizontal: Whether the direction is horizontal.
    ///   - width: Gradient width.
    ///   - height: Gradient height.
    /// - Returns: A CALayer.
    @discardableResult
    func addColorGradient(colors: [UIColor], isHorizontal: Bool = true, width: CGFloat? = nil, height: CGFloat? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let newWidth = width ?? bounds.size.width
        let newHeight = height ?? bounds.size.height
        gradientLayer.frame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        gradientLayer.startPoint = CGPoint.zero
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        }
        insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }

    /// Adds a radial color gradient.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    ///     view.layer.addRadialColorGradient(colors: [.white, .black], size: CGSize(width: 16, height: 16))
    ///     let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
    ///     print(gradientLayer!.frame.origin)
    ///     // Prints "(24.0, 24.0)"
    ///
    /// - Parameters:
    ///   - colors: Gradient UIColor array.
    ///   - startPoint: The start of the gradient when drawn into the layer's coordinate space.
    ///   - endPoint: The end points of the gradient when drawn into the layer's coordinate space.
    ///   - size: The size of the gradient.
    /// - Returns: A CAGradientLayer.
    @discardableResult
    func addRadialColorGradient(colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.5), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0), size: CGSize? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let size = size ?? bounds.size
        gradientLayer.frame = CGRect(origin: CGPoint(x: bounds.center.x - size.width / 2, y: bounds.center.y - size.height / 2), size: size)
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.type = kCAGradientLayerRadial
        insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }

}
