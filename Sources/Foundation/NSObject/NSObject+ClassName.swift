//
//  NSObject+ClassName.swift
//  SExtensions
//
//  Created by Ray on 2018/10/29.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension NSObject {

    /// The class name of a NSObject instance.
    ///
    ///     print(UIView().className)
    ///     // Prints "UIView"
    var className: String {
        return String(describing: type(of: self))
    }

    /// The class name of a NSObject.
    ///
    ///     print(UIView.className)
    ///     // Prints "UIView"
    class var className: String {
        return String(describing: self)
    }
}
