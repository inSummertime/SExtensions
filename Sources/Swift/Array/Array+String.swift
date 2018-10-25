//
//  Array+String.swift
//  SExtensions
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array where Element : StringProtocol {
    
    /// Returns longest common prefix of the elements.
    ///
    ///     print(["abc", "abcd", "abcde"].longestCommonPrefix)
    ///     // Prints "abc"
    var longestCommonPrefix: Element? {
        guard count > 0 else { return nil }
        guard let shortest = self.min(by: { $0.count < $1.count }) else { return nil }
        var prefix = shortest
        for element in self {
            while !element.hasPrefix(prefix), prefix.count > 0 {
                if let newPrefix = prefix.dropLast() as? Element {
                    prefix = newPrefix
                }
            }
        }
        return prefix
    }
    
    /// Returns longest common suffix of the elements.
    ///
    ///     print(["xyz", "wxyz", "vwxyz"].longestCommonSuffix)
    ///     // Prints "xyz"
    var longestCommonSuffix: Element? {
        guard count > 0 else { return nil }
        guard let shortest = self.min(by: { $0.count < $1.count }) else { return nil }
        var suffix = shortest
        for element in self {
            while !element.hasSuffix(suffix), suffix.count > 0 {
                if let newSuffix = suffix.dropFirst() as? Element {
                    suffix = newSuffix
                }
            }
        }
        return suffix
    }
    
    /// Returns a set of array of elements that are anagrams.
    ///
    ///     print(["ab", "ba", "abc", "acb", "bac", " ", ""].groupAnagrams)
    ///     //Prints "[["ab", "ba"], [""], [" "], ["abc", "acb", "bac"]]"
    var groupAnagrams: Set<[Element]> {
        if count == 0 { return Set<[Element]>() }
        var dictionary = [String: [Element]]()
        for element in self {
            let key = String(element.sorted())
            if !dictionary.keys.contains(key) {
                dictionary[key] = [Element]()
            }
            dictionary[key]?.append(element)
        }
        return Set(dictionary.map { $0.1 })
    }

}
