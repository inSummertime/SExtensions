//
//  NSObject+ClassName.swift
//  SExtensions
//
//  Created by Ray on 2018/10/29.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}
