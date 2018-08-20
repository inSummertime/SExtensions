//
//  URL+QueryParameter.swift
//  SExtensions
//
//  Created by Ray on 2018/8/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension URL {
    
    /// A Dictionary of query parameters
    ///
    ///     let url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
    ///     print(url?.queryParameters)
    ///     // Prints "Optional(["q": "iPhone", "oq": "", "source": "lnt"])"
    ///     url?.queryParameters = ["q": "iPad"]
    ///     print(url?.absoluteString == "https://www.google.com/search?q=iPad")
    ///     // Prints "true"
    var queryParameters: [String: String]? {
        get {
            guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false), let queryItems = components.queryItems else {
                return nil
            }
            var parameters = [String: String]()
            for queryItem in queryItems {
                parameters[queryItem.name] = queryItem.value
            }
            return parameters
        }
        set {
            let queryItems = newValue?.map({
                URLQueryItem(name: $0, value: $1)
            })
            var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)
            urlComponents?.queryItems = queryItems
            self = urlComponents?.url ?? self
        }
    }
    
    /// Returns the query parameter value for a key.
    ///
    ///     let url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
    ///     print(url?.queryParameterValue(for: "q") == "iPhone")
    ///     // Prints "true"
    ///
    /// - Parameter key: The key to associate with `value`.
    /// - Returns: The query parameter value.
    func queryParameterValue(for key: String) -> String? {
        return queryParameters?[key]
    }
    
    /// Updates the value for the given key, or adds a new key-value
    /// pair if the key does not exist.
    ///
    ///     var url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
    ///     url?.updateQueryParameterValue("iPad", for: "q")
    ///     print(url?.queryParameterValue(for: "q") == "iPad")
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - value: The new value to add.
    ///   - key: The key to associate with `value`.
    mutating func updateQueryParameterValue(_ value: String, for key: String) {
        var parameters = queryParameters ?? [String: String]()
        parameters[key] = value
        queryParameters = parameters
    }
    
    /// Removes the given key and its associated query parameter
    /// value.
    ///
    ///     var url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
    ///     url?.removeQueryParameterValue(forKey: "source")
    ///     print(url?.queryParameterValue(for: "source"))
    ///     // Prints "nil"
    ///
    /// - Parameter key: The key to remove along with its associated
    ///   value.
    mutating func removeQueryParameterValue(forKey key: String) {
        var parameters = queryParameters ?? [String: String]()
        parameters.removeValue(forKey: key)
        queryParameters = parameters
    }
    
}
