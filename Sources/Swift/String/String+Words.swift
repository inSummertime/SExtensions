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
    
    /// Reverse the words.
    ///
    ///     print("Hello world !".wordsReversed)
    ///     // Prints "! world Hello"
    var wordsReversed: String {
        var characters = Array(self)
        var i = 0
        var j = 0
        characters.reverse()
        while i < characters.count {
            j = i
            while j < characters.count && characters[j] != " " {
                j += 1
            }
            characters[i..<j].reverse()
            i = j + 1
        }
        return String(characters)
    }
    
    /// Returns true if it is an anagram with the given word.
    ///
    ///     print("abc".isAnagram(with: "acb"))
    ///     // Prints "true"
    ///
    /// - Parameter word: A string.
    /// - Returns: Returns true if it is an anagram with the given word.
    func isAnagram(with word: String) -> Bool {
        if count != word.count { return false }
        return Set(Array(self)) == Set(Array(word))
    }
    
}
