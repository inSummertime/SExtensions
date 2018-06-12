//
//  String+Dictionary.swift
//  SExtensions
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    /// A dictionary if possible.
    ///
    ///     print("{\"name\": \"inSummertime\"}".dictionary!["name"])
    ///     // Prints "Optional(inSummertime)"
    var dictionary: [String: Any]? {
        if let data = data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    /// A dictionary or a empty dictionary.
    ///
    ///     print("{\"name\": \"inSummertime\"}".dictionaryValue)
    ///     // Prints "["name": inSummertime]"
    var dictionaryValue: [String: Any] {
        return dictionary ?? [String: Any]()
    }
    
}
