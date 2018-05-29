//
//  String+Trimmed.swift
//  SExtensions
//
//  Created by Ray on 2018/5/27.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

extension String {
    
    /// A whitespaces and newlines trimmed string.
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// A whitespace trimmed string.
    var whitespaceTrimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    /// A newline trimmed string.
    var newlineTrimmed: String {
        return trimmingCharacters(in: CharacterSet.newlines)
    }
    
}
