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
    /// - Parameters:
    ///   - string: The URL string for the request.
    ///   - cachePolicy: The cache policy for the request. Defaults to
    ///     `.useProtocolCachePolicy`.
    ///   - timeoutInterval: The timeout interval for the request. Defaults to
    ///     60.0.
    init?(string: String, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 60.0) {
        guard let url = URL(string: string) else { return nil }
        self.init(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
    /// Creates and initializes a URLRequest with the given URL sting,
    /// relative to another URL. Returns `nil` if a `URL` cannot be formed
    /// with the string (for example, if the string contains characters that
    /// are illegal in a URL, or is an empty string).
    ///
    /// - Parameters:
    ///   - string: The URL string for the request.
    ///   - url: another URL.
    ///   - cachePolicy: The cache policy for the request. Defaults to
    ///     `.useProtocolCachePolicy`
    ///   - timeoutInterval: The timeout interval for the request. Defaults to
    ///     60.0.
    init?(string: String, relativeTo url: URL?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 60.0) {
        guard let url = URL(string: string, relativeTo: url) else { return nil }
        self.init(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
}
