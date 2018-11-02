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
    func removeAllSublayers() {
        sublayers?.forEach {
            $0.removeFromSuperlayer()
        }
    }
    
}
