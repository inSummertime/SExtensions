//
//  CALayer+RemoveAllSublayers.swift
//  SExtensions
//
//  Created by Ray on 2018/11/2.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// Removes all the sublayers.
    ///
    ///     let parentlayer = CALayer()
    ///     let sublayer = CALayer()
    ///     parentlayer.addSublayer(sublayer)
    ///     let anotherSublayer = CALayer()
    ///     parentlayer.addSublayer(anotherSublayer)
    ///     parentlayer.removeAllSublayers()
    ///     print(parentlayer.sublayers.count)
    ///     // Prints "0"
    func removeAllSublayers() {
        sublayers?.forEach {
            $0.removeFromSuperlayer()
        }
    }

}
