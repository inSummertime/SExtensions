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
    ///     view.layer.addColorGradientBorder(color: [UIColor.white, UIColor.black], lineWidth: 1, side: .all, isHorizontal: true)
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
    ///   - colors: Gradient UIColor array.
    ///   - lineWidth: Border width.
    ///   - side: Which side the border is on.
    ///   - isHorizontal: Whether the gradient direction is horizontal.
    /// - Returns: A CAGradientLayer.
    @discardableResult
    func addColorGradientBorder(colors: [UIColor], lineWidth: CGFloat, side: BorderSide, isHorizontal: Bool? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: bounds.size)
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
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

    /// Adds color gradient round borders.
    ///
    /// - Parameters:
    ///   - colors: Gradient UIColor array.
    ///   - width: Border width.
    ///   - isHorizontal: Whether the gradient direction is horizontal.
    ///   - corners: An instance of UIRectCorner which defines which corner needs to be round.
    ///   - radius: A CGFloat value that measures how round the corner is.
    func addColorGradientRoundBorder(colors: [UIColor], width: CGFloat, isHorizontal: Bool = true, corners: UIRectCorner = [.allCorners], radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        mask = shapeLayer

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        gradientLayer.startPoint = CGPoint.zero
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        }

        let gradientPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let gradientShapeLayer = CAShapeLayer()
        gradientShapeLayer.path = gradientPath.cgPath
        gradientShapeLayer.lineWidth = width
        gradientShapeLayer.fillColor = nil
        gradientShapeLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = gradientShapeLayer

        addSublayer(gradientLayer)
    }

    /// Animates border color and width.
    ///
    /// - Parameters:
    ///   - duration: Animation duration.
    ///   - color: A instance of UIColor which defines what color the border will animate to.
    ///   - width: A CGFloat value that measures how bold the border will animate to.
    func animateBorders(duration: CFTimeInterval, color: UIColor? = nil, width: CGFloat? = nil) {
        let toColor = color?.cgColor ?? borderColor
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        colorAnimation.toValue = toColor

        let toWidth = width ?? borderWidth
        let widthAnimation = CABasicAnimation(keyPath: "borderWidth")
        widthAnimation.toValue = toWidth

        let animationGroup = CAAnimationGroup()
        animationGroup.duration = duration
        animationGroup.animations = [colorAnimation, widthAnimation]
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        add(animationGroup, forKey: nil)
    }
    
    /// Adds dashed borders.
    ///
    /// - Parameters:
    ///   - side: Which side the border is on.
    ///   - color: A instance of UIColor which defines what color the border is.
    ///   - lineWidth: A CGFloat value that measures how bold the border is.
    ///   - lineDashPattern: The dash pattern (an array of NSNumbers) applied when creating the
    ///     stroked version of the path.
    /// - Returns: A CAShapeLayer.
    @discardableResult
    func addDashedBorder(side: BorderSide, color: UIColor, lineWidth: CGFloat, lineDashPattern: [NSNumber]) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineDashPattern = lineDashPattern
        let path = CGMutablePath()
        let width = bounds.size.width
        let height = bounds.size.height
        switch side {
        case .all:
            path.addLines(between: [CGPoint(x: 0, y: lineWidth / 2), CGPoint(x: width, y: lineWidth / 2)])
            path.addLines(between: [CGPoint(x: width - lineWidth / 2, y: 0), CGPoint(x: width - lineWidth / 2, y: height)])
            path.addLines(between: [CGPoint(x: 0, y: height - lineWidth / 2), CGPoint(x: width, y: height - lineWidth / 2)])
            path.addLines(between: [CGPoint(x: lineWidth / 2, y: 0), CGPoint(x: lineWidth / 2, y: height)])
        case .top:
            path.addLines(between: [CGPoint(x: 0, y: lineWidth / 2), CGPoint(x: width, y:  lineWidth / 2)])
        case .right:
            path.addLines(between: [CGPoint(x: width - lineWidth / 2, y: 0), CGPoint(x: width - lineWidth / 2, y: height)])
        case .bottom:
            path.addLines(between: [CGPoint(x: 0, y: height - lineWidth / 2), CGPoint(x: width, y: height - lineWidth / 2)])
        case .left:
            path.addLines(between: [CGPoint(x: lineWidth / 2, y: 0), CGPoint(x: lineWidth / 2, y: height)])
        }
        shapeLayer.path = path
        addSublayer(shapeLayer)
        return shapeLayer
    }

}
