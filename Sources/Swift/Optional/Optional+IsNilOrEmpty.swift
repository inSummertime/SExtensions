//
//  Optional+IsNilOrEmpty.swift
//  SExtensions
//
//  Created by Ray on 2018/9/29.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Optional where Wrapped: Collection {

    /// Returns true if it is nil or empty.
    var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
}

public extension Optional where Wrapped == String {

    /// Returns true if it is nil or empty.
    var isNilOrEmpty: Bool {
        guard let string = self else { return true }
        return string.isEmpty
    }
}
