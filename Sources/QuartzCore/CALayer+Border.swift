//
//  CALayer+Border.swift
//  SExtensions
//
//  Created by Ray on 2018/11/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore
import UIKit

public extension CALayer {
    
    /// Which side the border is on.
    ///
    /// - all: All sides.
    /// - top: Top side.
    /// - right: Right side.
    /// - bottom: Bottom side.
    /// - left: Left side.
    enum BorderSide {
        case all, top, right, bottom, left
    }

    /// Remove all borders.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addBorders(color: .white, width: 1.0)
    ///     view.layer.clearBorders()
    ///     print(view.layer.borderColor == UIColor.clear.cgColor)
    ///     // Prints "true"
    ///     print(view.layer.borderWidth == 0)
    ///     // Prints "true"
    func clearBorders() {
        borderColor = UIColor.clear.cgColor
        borderWidth = 0
    }
    
    /// Add borders.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addBorders(color: .white, width: 1.0)
    ///     print(view.layer.borderColor == UIColor.white.cgColor)
    ///     // Prints "true"
    ///     print(view.layer.borderWidth == 1.0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - side: Which side the border is on.
    ///   - color: A instance of UIColor which defines what color the border is.
    ///   - width: A CGFloat value that measures how bold the border is.
    /// - Returns: A Optional CALayer.
    @discardableResult
    func addBorder(color: UIColor, width: CGFloat, side: BorderSide = .all) -> CALayer? {
        switch side {
        case .all:
            borderColor = color.cgColor
            borderWidth = width
            return nil
        case .top:
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
            addSublayer(border)
            return border
        case .right:
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: frame.size.width - width, y: 0, width: width, height: frame.size.height)
            addSublayer(border)
            return border
        case .bottom:
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: width)
            addSublayer(border)
            return border
        case .left:
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: 0, width: width, height: frame.size.height)
            addSublayer(border)
            return border
        }
    }

    /// Adds color gradient border.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    ///     view.layer.addColorGradientBorder(startColor: UIColor.white, endColor: UIColor.black, lineWidth: 1, side: .all, isHorizontal: true)
    ///     let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
    ///     print(gradientLayer!.bounds == view.bounds)
    ///     // Print "true"
    ///     print(gradientLayer!.colors?.first as! CGColor == UIColor.white.cgColor)
    ///     // Print "true"
    ///     print(gradientLayer!.colors?.last as! CGColor == UIColor.black.cgColor)
    ///     // Print "true"
    ///     print(gradientLayer!.startPoint.x == 0)
    ///     // Print "true"
    ///     print(gradientLayer!.startPoint.y == 0)
    ///     // Print "true"
    ///     print(gradientLayer!.endPoint.x == 1.0)
    ///     // Print "true"
    ///     print(gradientLayer!.endPoint.y == 0)
    ///     // Print "true"
    ///
    /// - Parameters:
    ///   - startColor: Start UIColor.
    ///   - endColor: End UIColor.
    ///   - lineWidth: Border width.
    ///   - side: Which side the border is on.
    ///   - isHorizontal: Whether the direction is horizontal.
    /// - Returns: A CAGradientLayer.
    @discardableResult
    func addColorGradientBorder(startColor: UIColor, endColor: UIColor, lineWidth: CGFloat, side: BorderSide, isHorizontal: Bool? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: bounds.size)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint.zero
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        switch side {
        case .all:
            if let isHorizontal = isHorizontal {
                if isHorizontal {
                    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
                } else {
                    gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
                }
            }
            shapeLayer.path = UIBezierPath(rect: bounds).cgPath
        case .top:
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
            shapeLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)).cgPath
        case .right:
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
            shapeLayer.path = UIBezierPath(rect: CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)).cgPath
        case .bottom:
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
            shapeLayer.path = UIBezierPath(rect: CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)).cgPath
        case .left:
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
            shapeLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)).cgPath
        }
        gradientLayer.mask = shapeLayer
        addSublayer(gradientLayer)
        return gradientLayer
    }

}
