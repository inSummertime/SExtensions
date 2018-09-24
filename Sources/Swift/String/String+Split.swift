//
//  String+Split.swift
//  SExtensions
//
//  Created by Ray on 2018/9/14.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {
    
    /// Splits a string by a given lenght.
    ///
    ///     print("Hello World!".spliting(by: 6) == ["Hello ", "World!"])
    ///     // Prints "true"
    ///
    /// - Parameter length: A length of each string.
    /// - Returns: An array of strings.
    func spliting(by length: Int) -> [String] {
        var result = [String]()
        var collectedCharacters = [Character]()
        collectedCharacters.reserveCapacity(length)
        var count = 0
        for character in self {
            collectedCharacters.append(character)
            count += 1
            if count == length {
                count = 0
                result.append(String(collectedCharacters))
                collectedCharacters.removeAll(keepingCapacity: true)
            }
        }
        if !collectedCharacters.isEmpty {
            result.append(String(collectedCharacters))
        }
        return result
    }
    
    /// Splits a string by captital letters or punctuation.
    ///
    ///     print("Hello World!".splitingByCapitalLettersOrPunctuation() == ["Hello", "World", "!"])
    ///     // Prints "true"
    ///
    /// - Returns: An array of strings.
    func splitingByCapitalLettersOrPunctuation() -> [String] {
        var array: [String] = []
        for character in self {
            if String(character) != " ", String(character) == String(character).uppercased() {
                array.append(" ")
            }
            array.append(String(character))
        }
        if array.count == 0 { return array }
        let string = array.joined().condensingString(" ")
        let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.components(separatedBy: " ")
    }
    
}
