//
//  URL+IsFromDomain.swift
//  SExtensions
//
//  Created by Ray on 2018/8/22.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension URL {

    /// Returns true if the url is from a domain.
    ///
    ///     let url = URL(string: "https://www.google.com/search?q=iPhone")!
    ///     print(url.isFromDomain("google.com"))
    ///     // Prints "true"
    ///     print(url.isFromDomain("www.google.com"))
    ///     // Prints "true"
    ///
    /// - Parameter domain: The domain.
    /// - Returns: Returns true if the url is from a domain.
    func isFromDomain(_ domain: String) -> Bool {
        guard let host = host else {
            return false
        }
        var selfHostComponents = host.components(separatedBy: ".")
        var targetHostComponents = domain.components(separatedBy: ".")
        let selfComponentsCount = selfHostComponents.count
        let targetComponentsCount = targetHostComponents.count
        let offset = selfComponentsCount - targetComponentsCount
        if offset < 0 {
            return false
        }
        for i in offset ..< selfComponentsCount where !(selfHostComponents[i] == targetHostComponents[i - offset]) {
            return false
        }
        return true
    }
}
