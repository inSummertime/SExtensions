//
//  CALayer+ColorGradient.swift
//  SExtensions
//
//  Created by Ray on 2018/11/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

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
    ///   - startColor: Start UIColor.
    ///   - endColor: End UIColor.
    ///   - isHorizontal: Whether the direction is horizontal.
    ///   - width: Gradient width.
    ///   - isHorizontal: Gradient height.
    @discardableResult
    func addColorGradient(startColor: UIColor, endColor: UIColor, isHorizontal: Bool = true, width: CGFloat? = nil, height: CGFloat? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let newWidth = width ?? bounds.size.width
        let newHeight = height ?? bounds.size.height
        gradientLayer.frame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint.zero
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        }
        insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }

}
