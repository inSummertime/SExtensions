//
//  URLRequestSetHTTPHeaderFieldsTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/26.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class URLRequestSetHTTPHeaderFieldsTests: XCTestCase {

    func testSetHTTPHeaderFields() {
        let url = URL(string: "https://www.google.com")
        var urlRequest = URLRequest(url: url!)
        let HTTPHeaderFields = ["Content-Type": "application/x-www-form-urlencoded; charset=utf-8", "Content-Length": "1"]
        urlRequest.setHTTPHeaderFields(HTTPHeaderFields)
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Type"), "application/x-www-form-urlencoded; charset=utf-8")
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Length"), "1")
    }

}
