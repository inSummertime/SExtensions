//
//  URLHostURLTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/21.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class URLHostURLTests: XCTestCase {
    
    func testHostURL() {
        let baseURL = URL(string: "https://www.google.com")
        let url = URL(string: "search?q=iPhone", relativeTo: baseURL)
        XCTAssertEqual(url?.hostURL, baseURL)
        let absoluteURL = URL(string: "https://www.google.com/search?q=iPhone")
        XCTAssertEqual(absoluteURL?.hostURL, baseURL)
    }
    
}
