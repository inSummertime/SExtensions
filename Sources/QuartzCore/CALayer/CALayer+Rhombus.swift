//
//  CALayer+Rhombus.swift
//  SExtensions
//
//  Created by Ray on 2019/1/1.
//  Copyright © 2019 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// Adds a rhombus mask.
    ///
    /// - Parameter isSqureNeeded: A Bool value represnts whether rhombus is a squre.
    /// - Returns: A CAShapeLayer.
    func addRhombusMask(isSqureNeeded: Bool = false) -> CAShapeLayer {
        let path = UIBezierPath()
        if isSqureNeeded {
            if bounds.size.width > bounds.size.height {
                path.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
                path.addLine(to: CGPoint(x: bounds.midX + bounds.midY, y: bounds.midY))
                path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
                path.addLine(to: CGPoint(x: bounds.midX - bounds.midY, y: bounds.midY))
            } else {
                path.move(to: CGPoint(x: bounds.midX, y: bounds.midY - bounds.midX))
                path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
                path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY + bounds.midX))
                path.addLine(to: CGPoint(x: bounds.minX, y: bounds.midY))
            }
        } else {
            path.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
            path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
            path.addLine(to: CGPoint(x: bounds.minX, y: bounds.midY))
        }
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        mask = shapeLayer
        return shapeLayer
    }
}
