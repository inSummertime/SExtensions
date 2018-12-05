//
//  String+Array.swift
//  SExtensions
//
//  Created by Ray on 2018/6/13.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {

    /// An array if possible
    ///
    ///     print("[1, \"Hello world!\"]".array)
    ///     // Prints "Optional([1, Hello world!])"
    var array: [Any]? {
        if let data = data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    /// An array or an empty array
    ///
    ///     print("[1, \"Hello world!\"]".arrayValue[0])
    ///     // Prints "1"
    var arrayValue: [Any] {
        return array ?? [Any]()
    }

}
