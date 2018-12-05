//
//  Encodable+Dictionary.swift
//  SExtensions
//
//  Created by Ray on 2018/9/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Encodable {

    /// Creates a dictionary from a object which confirms Encodable
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        let dictionary = jsonObject.flatMap { $0 as? [String: Any] }
        return dictionary
    }

}
