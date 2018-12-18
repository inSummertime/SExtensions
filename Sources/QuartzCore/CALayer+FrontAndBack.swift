//
//  CALayer+FrontAndBack.swift
//  SExtensions
//
//  Created by Ray on 2018/12/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// Brings to the front.
    ///
    ///     let superlayer = CALayer()
    ///     let sublayer = CALayer()
    ///     let anotherSublayer = CALayer()
    ///     superlayer.addSublayer(sublayer)
    ///     superlayer.addSublayer(anotherSublayer)
    ///     sublayer.bringToFront()
    ///     print(superlayer.sublayers!.first! == anotherSublayer)
    ///     // Print "true"
    func bringToFront() {
        guard let superlayer = superlayer else {
            return
        }
        removeFromSuperlayer()
        superlayer.insertSublayer(self, at: UInt32(superlayer.sublayers?.count ?? 0))
    }

    /// Sends to the back.
    ///
    ///     let superlayer = CALayer()
    ///     let sublayer = CALayer()
    ///     let anotherSublayer = CALayer()
    ///     superlayer.addSublayer(sublayer)
    ///     superlayer.addSublayer(anotherSublayer)
    ///     anotherSublayer.sendToBack()
    ///     print(superlayer.sublayers!.first! == anotherSublayer)
    ///     // Print "true"
    func sendToBack() {
        guard let superlayer = superlayer else {
            return
        }
        removeFromSuperlayer()
        superlayer.insertSublayer(self, at: 0)
    }

    /// Brings a sublayer to the front.
    ///
    ///     let superlayer = CALayer()
    ///     let sublayer = CALayer()
    ///     let anotherSublayer = CALayer()
    ///     superlayer.addSublayer(sublayer)
    ///     superlayer.addSublayer(anotherSublayer)
    ///     superlayer.bringSublayerToFront(sublayer)
    ///     print(superlayer.sublayers!.first! == anotherSublayer)
    ///     // Print "true"
    ///
    /// - Parameter layer: A sublayer.
    func bringSublayerToFront(_ layer: CALayer) {
        layer.removeFromSuperlayer()
        insertSublayer(layer, at: UInt32(sublayers?.count ?? 0))
    }

    /// Sends a sublayer to the back.
    ///
    ///     let superlayer = CALayer()
    ///     let sublayer = CALayer()
    ///     let anotherSublayer = CALayer()
    ///     superlayer.addSublayer(sublayer)
    ///     superlayer.addSublayer(anotherSublayer)
    ///     superlayer.sendSublayerToBack(anotherSublayer)
    ///     print(superlayer.sublayers!.first! == anotherSublayer)
    ///     // Print "true"
    ///
    /// - Parameter layer: A sublayer.
    func sendSublayerToBack(_ layer: CALayer) {
        layer.removeFromSuperlayer()
        insertSublayer(layer, at: 0)
    }

}
