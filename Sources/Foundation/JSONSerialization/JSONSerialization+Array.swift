//
//  JSONSerialization+Array.swift
//  SExtensions
//
//  Created by Ray on 2018/9/4.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension JSONSerialization {

    /// Returns an array from a JSON file.
    ///
    /// - Parameters:
    ///   - filename: JSON file name.
    ///   - callerClass: The class of the caller.
    ///   - readingOptions: ReadingOptions.
    /// - Returns: An array or nil if cannot get a valid path from the
    ///   given name.
    /// - Throws: Throws an error in the Cocoa domain, if file cannot be
    ///   read, or throws an error when failing to create a Foundation object
    ///   from JSON data.
    class func arrayFromJSONFile(filename: String, callerClass: AnyClass? = nil, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) throws -> [[String: Any]]? {
        let json = try JSONSerialization.jsonObjectFromFile(filename: filename, callerClass: callerClass, readingOptions: readingOptions)
        return json as? [[String: Any]]
    }

    /// Returns an array from a JSON string.
    ///
    /// - Parameters:
    ///   - string: A JSON string.
    ///   - readingOptions: ReadingOptions.
    /// - Returns: An array or nil if cannot a valid data from the given
    ///   string.
    /// - Throws: Throws an error when failing to create a Foundation object
    ///   from JSON data or JSON serialization.
    class func arrayFromJSONString(_ string: String, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) throws -> [[String: Any]]? {
        let json = try JSONSerialization.jsonObjectFromString(string, readingOptions: readingOptions)
        return json as? [[String: Any]]
    }

}
