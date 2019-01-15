//
//  JSONSerialization+JSONObject.swift
//  SExtensions
//
//  Created by Ray on 2018/9/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension JSONSerialization {

    /// Creates a Foundation object from JSON data.
    ///
    /// - Parameters:
    ///   - filename: JSON file name.
    ///   - callerClass: The class of the caller.
    ///   - readingOptions: ReadingOptions.
    /// - Returns: A Foundation object or nil if cannot get a valid path from
    ///   the given name.
    /// - Throws: Throws an error in the Cocoa domain, if file cannot be
    ///   read, or throws an error when failing to create a Foundation object
    ///   from JSON data.
    class func jsonObjectFromFile(filename: String, callerClass: AnyClass? = nil, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) throws -> Any? {
        let name = filename.components(separatedBy: ".")[0]
        var bundle = Bundle.main
        if let aClass = callerClass {
            bundle = Bundle(for: aClass)
        }
        guard let path = bundle.path(forResource: name, ofType: "json") else { return nil }
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return try jsonObject(with: data, options: readingOptions)
    }

    /// Returns a Foundation object from a JSON string.
    ///
    /// - Parameters:
    ///   - string: A JSON string.
    ///   - readingOptions: ReadingOptions.
    /// - Returns: A Foundation object or nil if cannot a valid data from the
    ///   given string.
    /// - Throws: Throws an error when failing to create a Foundation object
    ///   from JSON data.
    class func jsonObjectFromString(_ string: String, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) throws -> Any? {
        guard let data = string.data(using: .utf8) else { return nil }
        return try jsonObject(with: data, options: readingOptions)
    }
}
