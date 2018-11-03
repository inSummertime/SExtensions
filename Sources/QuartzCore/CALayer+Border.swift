//
//  CALayer+Border.swift
//  SExtensions
//
//  Created by Ray on 2018/11/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {
    
    /// Add borders.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addBorders(color: .white, width: 1.0)
    ///     print(view.layer.borderColor == UIColor.white.cgColor)
    ///     // Prints "true"
    ///     print(view.layer.borderWidth == 1.0)
    ///     // Prints "true"
    ///
    /// - Parameter color: A instance of UIColor which defines what color is the borders.
    /// - Parameter width: A CGFloat value that measures how bold the borders are.
    func addBorders(color: UIColor, width: CGFloat) {
        borderColor = color.cgColor
        borderWidth = width
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
    
    /// Returns a CALayer that is added as a top border.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addTopBorder(color: .clear, borderWidth: 1.0)
    ///     let sublayers = view.layer.sublayers
    ///     print(sublayers!.count > 0)
    ///     // Prints "true"
    ///     let topBorderLayer = sublayers!.last
    ///     print(topBorderLayer!.frame.size.width == 7.0)
    ///     // Prints "true"
    ///     print(topBorderLayer!.frame.size.height == 1.0)
    ///     // Prints "true"
    ///
    /// - Parameter color: A instance of UIColor which defines what color is the border.
    /// - Parameter borderWidth: A CGFloat value that measures how bold the border is.
    /// - Parameter length: A CGFloat value that measures how long the border is.
    @discardableResult
    func addTopBorder(color: UIColor, borderWidth: CGFloat, length: CGFloat = 0) -> CALayer {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: length == 0 ? frame.size.width: length, height: borderWidth)
        addSublayer(border)
        return border
    }
    
    /// Returns a CALayer that is added as a right border.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addRightBorder(color: .clear, borderWidth: 1.0)
    ///     let sublayers = view.layer.sublayers
    ///     print(sublayers!.count > 0)
    ///     // Prints "true"
    ///     let topBorderLayer = sublayers!.last
    ///     print(topBorderLayer!.frame.size.width == 1.0)
    ///     // Prints "true"
    ///     print(topBorderLayer!.frame.size.height == 7.0)
    ///     // Prints "true"
    ///
    /// - Parameter color: A instance of UIColor which defines what color is the border.
    /// - Parameter borderWidth: A CGFloat value that measures how bold the border is.
    /// - Parameter length: A CGFloat value that measures how long the border is.
    @discardableResult
    func addRightBorder(color: UIColor, borderWidth: CGFloat, length: CGFloat = 0) -> CALayer {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: length == 0 ? frame.size.height : length)
        addSublayer(border)
        return border
    }
    
    /// Returns a CALayer that is added as a bottom border.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addBottomBorder(color: .clear, borderWidth: 1.0)
    ///     let sublayers = view.layer.sublayers
    ///     print(sublayers!.count > 0)
    ///     // Prints "true"
    ///     let topBorderLayer = sublayers!.last
    ///     print(topBorderLayer!.frame.size.width == 7.0)
    ///     // Prints "true"
    ///     print(topBorderLayer!.frame.size.height == 1.0)
    ///     // Prints "true"
    ///
    /// - Parameter color: A instance of UIColor which defines what color is the border.
    /// - Parameter borderWidth: A CGFloat value that measures how bold the border is.
    /// - Parameter length: A CGFloat value that measures how long the border is.
    @discardableResult
    func addBottomBorder(color: UIColor, borderWidth: CGFloat, length: CGFloat = 0, leftPadding: CGFloat = 0) -> CALayer {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: leftPadding, y: frame.size.height - borderWidth, width: length == 0 ? frame.size.width : length, height: borderWidth)
        addSublayer(border)
        return border
    }
    
    /// Returns a CALayer that is added as a left border.
    ///
    ///     let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
    ///     view.layer.addLeftBorder(color: .clear, borderWidth: 1.0)
    ///     let sublayers = view.layer.sublayers
    ///     print(sublayers!.count > 0)
    ///     // Prints "true"
    ///     let topBorderLayer = sublayers!.last
    ///     print(topBorderLayer!.frame.size.width == 1.0)
    ///     // Prints "true"
    ///     print(topBorderLayer!.frame.size.height == 7.0)
    ///     // Prints "true"
    ///
    /// - Parameter color: A instance of UIColor which defines what color is the border.
    /// - Parameter borderWidth: A CGFloat value that measures how bold the border is.
    /// - Parameter length: A CGFloat value that measures how long the border is.
    @discardableResult
    func addLeftBorder(color: UIColor, borderWidth: CGFloat, length: CGFloat = 0) -> CALayer {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: length == 0 ? frame.size.height: length)
        addSublayer(border)
        return border
    }
    
}
