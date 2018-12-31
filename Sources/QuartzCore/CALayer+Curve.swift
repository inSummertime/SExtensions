//
//  CALayer+Curve.swift
//  SExtensions
//
//  Created by Ray on 2018/12/31.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {
    
    /// The side that the curve is on.
    ///
    /// - top: Top side.
    /// - right: Right side.
    /// - bottom: Bottom side.
    /// - left: Left side.
    enum CurveSide {
        case top, right, bottom, left
    }
    
    /// Adds a curve on a side of a CALayer.
    ///
    /// - Parameters:
    ///   - side: An Enum represents which side the curve is on.
    ///   - curveValue: A CGFloat value that measures what height the curve is.
    /// - Returns: A CAShapeLayer.
    @discardableResult
    func addCurve(side: CurveSide, curveValue: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath()
        let width = bounds.size.width
        let height = bounds.size.height
        switch side {
        case .top:
            path.move(to: CGPoint(x: 0, y: curveValue))
            path.addQuadCurve(to: CGPoint(x: width, y: curveValue), controlPoint: CGPoint(x: width / 2, y: 0))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
        case .right:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width - curveValue, y: 0))
            path.addQuadCurve(to: CGPoint(x: width - curveValue, y: height), controlPoint: CGPoint(x: width, y: height / 2))
            path.addLine(to: CGPoint(x: 0, y: height))
        case .bottom:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            path.addLine(to: CGPoint(x: width, y: height - curveValue))
            path.addQuadCurve(to: CGPoint(x: 0, y: height - curveValue), controlPoint: CGPoint(x: width / 2, y: height))
        case .left:
            path.move(to: CGPoint(x: curveValue, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: curveValue, y: height))
            path.addQuadCurve(to: CGPoint(x: curveValue, y: 0), controlPoint: CGPoint(x: 0, y: height / 2))
        }
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
        mask = shapeLayer
        return shapeLayer
    }
    
}
