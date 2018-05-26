//
//  String+Trimmed.swift
//  SExtensions
//
//  Created by Ray on 2018/5/27.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

extension String {
    
    /// Remove whitespaces and newlines
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}
