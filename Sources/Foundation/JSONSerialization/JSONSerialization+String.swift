//
//  JSONSerialization+String.swift
//  SExtensions
//
//  Created by Ray on 2018/8/31.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    /// Returns a JSON string from a dictionary.
    ///
    ///     let dictionary: [String: Any] = ["id": 0, "title": "title"]
    ///     print(JSONSerialization.jsonString(with: dictionary)!)
    ///     // Prints "{"id":0,"title":"title"}"
    ///
    /// - Parameter dictionary: A dictionary.
    /// - Returns: A JSON string.
    class func jsonString(with dictionary: [String: Any]) -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
    
    /// Returns a JSON string from an array.
    ///
    ///     let array: [[String: Any]] = [["id": 0], ["title": "title"]]
    ///     print(JSONSerialization.jsonString(with: array)!)
    ///     // Prints "[{"id":0},{"title":"title"}]"
    ///
    /// - Parameter dictionary: An array.
    /// - Returns: A JSON string.
    class func jsonString(with array: [[String: Any]]) -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: array, options: []) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }

}
