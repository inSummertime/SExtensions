//
//  URLRequest+SetHTTPHeaderFields.swift
//  SExtensions
//
//  Created by Ray on 2018/8/26.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension URLRequest {

    /// Sets the HTTP header fields with a dictionary.
    ///
    ///     let url = URL(string: "https://www.google.com")
    ///     var urlRequest = URLRequest(url: url!)
    ///     let httpHeaderFields = ["Content-Type": "application/x-www-form-urlencoded; charset=utf-8"]
    ///     urlRequest.setHTTPHeaderFields(httpHeaderFields)
    ///     print(urlRequest.value(forHTTPHeaderField: "Content-Type") == "application/x-www-form-urlencoded; charset=utf-8")
    ///     // Prints "true"
    ///
    /// - Parameter fields: A dictionary containing the HTTP header fields.
    mutating func setHTTPHeaderFields(_ fields: [String: String]) {
        for (key, value) in fields where value != "" {
            setValue(value, forHTTPHeaderField: key)
        }
    }
}
