//
//  String+Words.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

public extension String {
    
    /// An array of words
    ///
    ///     print("Hello world!".words)
    ///     // Prints ["hello", "world!"]
    var words: [String] {
        return changingToSentenseCase().lowercased().components(separatedBy: .whitespacesAndNewlines).filter({ $0.count > 0})
    }
    
    /// How many word in a string
    ///
    ///     print("Hello world!".wordCount)
    ///     // Prints 2
    var wordCount: Int {
        return words.count
    }
    
}
