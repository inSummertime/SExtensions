//
//  String+Words.swift
//  SExtensions
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018 Ray. All rights reserved.
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

    /// Returns the longest palindrome
    ///
    ///     print("abab".longestPalindrome)
    ///     // Prints "bab"
    var longestPalindrome: String {
        guard count > 0 else { return "" }

        func expandAroundCenter(array: [Character], lhs: Int, rhs: Int) -> Int {
            var left = lhs, right = rhs
            while left >= 0, right < array.count, array[left] == array[right] {
                left -= 1
                right += 1
            }
            return right - left - 1
        }

        let characters = Array(self)
        var start = 0, end = 0
        for i in 0..<count {
            let length = expandAroundCenter(array: characters, lhs: i, rhs: i)
            let length2 = expandAroundCenter(array: characters, lhs: i, rhs: i + 1)
            let len = max(length, length2)
            if len > end - start {
                start = i - (len - 1)/2
                end = i + len/2
            }
        }
        return String(characters[start...end])
    }

}
