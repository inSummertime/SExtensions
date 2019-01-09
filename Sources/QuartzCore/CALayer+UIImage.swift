//
//  CALayer+UIImage.swift
//  SExtensions
//
//  Created by Ray on 2019/1/2.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import QuartzCore
import UIKit

public extension CALayer {

    var image: UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

}
