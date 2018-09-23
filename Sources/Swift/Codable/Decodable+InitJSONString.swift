//
//  Decodable+InitJSONString.swift
//  SExtensions
//
//  Created by Ray on 2018/9/23.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Decodable {
    
    /// Creates a new instance using a JSON string.
    ///
    /// - Parameter jsonString: A JSON String.
    /// - Throws: throws an error when failing to create a Foundation object
    ///   from JSON data.
    init?(jsonString: String) throws {
        guard let jsonData = jsonString.data(using: .utf8) else { return nil }
        self = try JSONDecoder().decode(Self.self, from: jsonData)
    }
    
}
