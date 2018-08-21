//
//  URL+HostURL.swift
//  SExtensions
//
//  Created by Ray on 2018/8/21.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension URL {
    
    /// Returns baseURL if baseURL is not nil, or removes all query parameters and path components
    var hostURL: URL {
        if let url = baseURL {
            return url
        } else {
            var url = self
            url.queryParameters = nil
            for _ in 0..<pathComponents.count - 1 {
                url.deleteLastPathComponent()
            }
            if let last = url.absoluteString.last, String(last) == "/" {
                let absoluteString = url.absoluteString.dropLast()
                if let newURL = URL(string: String(absoluteString)) {
                    url = newURL
                }
            }
            return url
        }
    }

}
