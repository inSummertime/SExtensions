//
//  CALayer+Shake.swift
//  SExtensions
//
//  Created by Ray on 2019/1/6.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import QuartzCore
import UIKit

public extension CALayer {
    
    /// Adds a shake animation.
    ///
    /// - Parameters:
    ///   - duration: Animation duration.
    ///   - translation: The transform translation.
    ///   - repeatCount: The repeat count of the animation.
    ///   - isHorizontal: if true, animate horizontally, else, animate vertically.
    /// - Returns: A CAKeyframeAnimation.
    @discardableResult
    func shake(duration: TimeInterval, translation: CGFloat, repeatCount: Float, isHorizontal: Bool = true) -> CAKeyframeAnimation {
        var keyPath = "transform.translation.y"
        if isHorizontal {
            keyPath = "transform.translation.x"
        }
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.values = [0, -translation / 2, -translation, -translation / 2, 0, translation / 2, translation, translation / 2, 0]
        add(animation, forKey: nil)
        return animation
    }

}
