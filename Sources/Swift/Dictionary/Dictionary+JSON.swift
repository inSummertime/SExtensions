//
//  Dictionary+JSON.swift
//  SExtensions
//
//  Created by Ray on 2018/6/18.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Dictionary {
    
    /// Generates JSON data if possible.
    ///
    ///     print(["hello": "world"].jsonData() == "{\"hello\":\"world\"}".data(using: .utf8))
    ///     // Prints "true"
    ///
    /// - Parameter options: JSONSerialization.WritingOptions.
    /// - Returns: Optional data.
    func jsonData(options: JSONSerialization.WritingOptions = []) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
    
    /// Generates a string if possible.
    ///
    ///     print(["hello": "world"].jsonString())
    ///     // Prints "Optional("{\"hello\":\"world\"}")"
    ///
    /// - Parameter options: JSONSerialization.WritingOptions.
    /// - Returns: Optional string.
    func jsonString(options: JSONSerialization.WritingOptions = []) -> String? {
        guard let jsonData = jsonData(options: options) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }
    
}
