//
//  CALayer+TriangleCorner.swift
//  SExtensions
//
//  Created by Ray on 2018/12/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import CoreGraphics
import QuartzCore
import UIKit

public extension CALayer {

    /// Adds a triangle corner with a given size and color.
    ///
    /// - Parameters:
    ///   - corner: UIRectCorner.
    ///   - size: Triangle size.
    ///   - color: Triangle color.
    /// - Returns: a CAShapeLayer.
    @discardableResult
    func addTriangleCorner(corner: UIRectCorner, size: CGSize, color: UIColor) -> CAShapeLayer {
        var rect = CGRect.zero
        switch corner {
        case .topLeft:
            rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        case .topRight:
            rect = CGRect(x: bounds.size.width - size.width, y: 0, width: size.width, height: size.height)
        case .bottomRight:
            rect = CGRect(x: bounds.size.width - size.width, y: bounds.size.height - size.height, width: size.width, height: size.height)
        case .bottomLeft:
            rect = CGRect(x: 0, y: bounds.size.height - size.height, width: size.width, height: size.height)
        default:
            break
        }

        let trianglePath = UIBezierPath()
        let rectOriginX = rect.origin.x
        let rectOriginY = rect.origin.y
        let rectWidth = rect.width + rectOriginX
        let rectHeight = rect.width + rectOriginY
        var points = [CGPoint]()

        switch corner {
        case .topLeft:
            points = [CGPoint(x: rectOriginX, y: rectOriginY), CGPoint(x: rectWidth, y: rectOriginY), CGPoint(x: rectOriginX, y: rectHeight), CGPoint(x: rectOriginX, y: rectOriginY)]
        case .topRight:
            points = [CGPoint(x: rectOriginX, y: rectOriginY), CGPoint(x: rectWidth, y: rectOriginY), CGPoint(x: rectWidth, y: rectHeight), CGPoint(x: rectOriginX, y: rectOriginY)]
        case .bottomLeft:
            points = [CGPoint(x: rectOriginX, y: rectOriginY), CGPoint(x: rectWidth, y: rectHeight), CGPoint(x: rectOriginX, y: rectHeight), CGPoint(x: rectOriginX, y: rectOriginY)]
        case .bottomRight:
            points = [CGPoint(x: rectWidth, y: rectOriginY), CGPoint(x: rectWidth, y: rectHeight), CGPoint(x: rectOriginX, y: rectHeight), CGPoint(x: rectWidth, y: rectOriginY)]
        default:
            break
        }

        trianglePath.move(to: points[0])
        trianglePath.addLine(to: points[1])
        trianglePath.addLine(to: points[2])
        trianglePath.addLine(to: points[3])
        trianglePath.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = trianglePath.cgPath
        shapeLayer.fillColor = color.cgColor
        insertSublayer(shapeLayer, at: 0)

        return shapeLayer
    }

}
