//
//  CGRect+Center.swift
//  SExtensions
//
//  Created by Ray on 2018/9/11.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension CGRect {

    /// The center CGPoint.
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 2.0, height: 4.0)
    ///     print(rect.center == CGPoint(x: 1.0, y: 2.0))
    ///     // Prints "true"
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }



}



