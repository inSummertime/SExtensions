//
//  CALayer+PerformWithoutAnimation.swift
//  SExtensions
//
//  Created by Ray on 2018/12/20.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// Performs an action without animation.
    ///
    /// - Parameter actionsWithoutAnimation: The action.
    class func performWithoutAnimation(_ actionsWithoutAnimation: () -> Void) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        actionsWithoutAnimation()
        CATransaction.commit()
    }

}
