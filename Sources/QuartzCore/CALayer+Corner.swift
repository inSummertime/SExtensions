//
//  CALayer+Corner.swift
//  SExtensions
//
//  Created by Ray on 2018/12/13.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// Returns a CALayer with rounded corners.
    ///
    /// - Parameter corners: an instance of UIRectCorner which defines which corner needs to be rounded.
    /// - Parameter radius: a CGFloat value that measures how round the corner is.
    @discardableResult
    func addRoundCorners(corners: UIRectCorner = [.allCorners], radius: CGFloat) -> CALayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        mask = shapeLayer
        return shapeLayer
    }

    /// Makes the corners round.
    ///
    /// - Parameter radius: a CGFloat value that measures how round the corner is.
    func beRound(radius: CGFloat? = nil) {
        masksToBounds = true
        let cornerRadius = radius ?? min(bounds.size.width, bounds.size.height) / 2.0
        self.cornerRadius = cornerRadius
    }
    
}
