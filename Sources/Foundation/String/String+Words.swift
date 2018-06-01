//
//  String+Words.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// An array of words
    var words: [String] {
        return sentenseCased.lowercased().components(separatedBy: .whitespacesAndNewlines).filter({ $0.count > 0})
    }
    
    /// How many word in a string
    var wordCount: Int {
        return words.count
    }
    
}