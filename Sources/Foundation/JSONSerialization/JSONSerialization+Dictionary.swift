//
//  JSONSerialization+Dictionary.swift
//  SExtensions
//
//  Created by Ray on 2018/8/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    /// Returns a dictionary from a JSON file.
    ///
    /// - Parameters:
    ///   - filename: JSON file name.
    ///   - callerClass: The class of the caller.
    ///   - readingOptions: ReadingOptions.
    /// - Returns: A dictionary or nil if cannot get a valid path from the
    ///   given name.
    /// - Throws: Throws an error in the Cocoa domain, if `url` cannot be
    ///   read, or throws an error when failing to create a Foundation object
    ///   from JSON data or JSON serialization.
    class func dictionaryFromJSONFile(filename: String, callerClass: AnyClass? = nil, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) throws -> [String: Any]? {
        let name = filename.components(separatedBy: ".")[0]
        var bundle = Bundle.main
        if let aClass = callerClass {
            bundle = Bundle(for: aClass)
        }
        guard let path = bundle.path(forResource: name, ofType: "json") else { return nil }
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let json = try jsonObject(with: data, options: readingOptions)
        return json as? [String: Any]
    }
    
    /// Returns a dictionary from a JSON string.
    ///
    /// - Parameters:
    ///   - string: A JSON string.
    ///   - readingOptions: ReadingOptions
    /// - Returns: A dictionary or nil if cannot a valid data from the given
    ///   string.
    /// - Throws: throws an error when failing to create a Foundation object
    ///   from JSON data or JSON serialization.
    class func dictionaryFromJSONString(_ string: String, readingOptions: JSONSerialization.ReadingOptions = .allowFragments) throws -> [String: Any]? {
        guard let data = string.data(using: .utf8) else { return nil }
        let json = try jsonObject(with: data, options: readingOptions)
        return json as? [String: Any]
    }
    
}
