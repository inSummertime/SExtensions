//
//  String+Dictionary.swift
//  SExtensions
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {
    
    /// A dictionary from a JSON string if possible.
    ///
    ///     print("{\"hello\": \"world\"}".jsonDictionary)
    ///     // Prints "Optional(["hello": "world"])"
    var jsonDictionary: [String: Any]? {
        if let data = data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    /// A dictionary or a empty dictionary from a JSON string.
    ///
    ///     print("{\"hello\": \"world\"}".dictionaryValue)
    ///     // Prints "["hello": world]"
    var jsonDictionaryValue: [String: Any] {
        return jsonDictionary ?? [String: Any]()
    }
    
    /// A dictionary from a string if possible.
    ///
    ///     print("hello: world".stringDictionary)
    ///     // Prints "Optional(["hello": "world"])"
    var stringDictionary: [String: String]? {
        var result = [String: String]()
        let pairs = self.components(separatedBy: ",")
        for pair in pairs {
            let array = pair.components(separatedBy: ":")
            if array.count == 2, let key = array.first, let value = array.last, key.trimmed.count > 0, value.trimmed.count > 0 {
                result[key.trimmed] = value.trimmed
            }
        }
        if result.isEmpty || result.count != pairs.count {
            return nil
        }
        return result
    }
    
    /// A dictionary or a empty dictionary from a string.
    ///
    ///     print("hello: world".stringDictionaryValue)
    ///     // Prints "["hello": world]"
    var stringDictionaryValue: [String: String] {
        return stringDictionary ?? [String: String]()
    }
    
}
