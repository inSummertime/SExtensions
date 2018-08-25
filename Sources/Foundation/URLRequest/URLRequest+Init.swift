//
//  URLRequest+Init.swift
//  SExtensions
//
//  Created by Ray on 2018/8/25.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension URLRequest {
    
    /// Creates and initializes a URLRequest with the given URL sting. Returns
    /// `nil` if a `URL` cannot be formed with the string (for example, if the
    /// string contains characters that are illegal in a URL, or is an empty
    /// string).
    ///
    /// - Parameter string: The URL string for the request.
    init?(string: String) {
        guard let url = URL(string: string) else { return nil }
        self.init(url: url)
    }
    
    /// Creates and initializes a URLRequest with the given URL sting,
    /// relative to another URL. Returns `nil` if a `URL` cannot be formed
    /// with the string (for example, if the string contains characters that
    /// are illegal in a URL, or is an empty string).
    ///
    /// - Parameters:
    ///   - string: The URL string for the request.
    ///   - url: another URL.
    init?(string: String, relativeTo url: URL?) {
        guard let url = URL(string: string, relativeTo: url) else { return nil }
        self.init(url: url)
    }
    
}
