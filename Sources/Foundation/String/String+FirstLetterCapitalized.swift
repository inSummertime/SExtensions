//
//  String+FirstLetterCapitalized.swift
//  Extensions
//
//  Created by Ray on 2018/5/26.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// First letter capitalized string
    var firstLetterCapitalized: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    /// Capitalize the first letter
    mutating func capitalizeFirstLetter() {
        self = firstLetterCapitalized
    }
    
}
