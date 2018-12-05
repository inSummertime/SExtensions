//
//  URLRequestInitTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/25.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class URLRequestInitTests: XCTestCase {

    func testInitString() {
        let url = URL(string: "https://www.google.com")
        let urlRequest = URLRequest(string: "https://www.google.com")
        XCTAssertEqual(urlRequest, URLRequest(url: url!))
    }

    func testInitStringRelativeToURL() {
        let baseURL = URL(string: "https://www.google.com")
        let url = URL(string: "search?q=iPhone", relativeTo: baseURL)
        let urlRequest = URLRequest(string: "search?q=iPhone", relativeTo: baseURL)
        XCTAssertEqual(urlRequest, URLRequest(url: url!))
    }

    func testInitStringHTTPHeaderFields() {
        let url = URL(string: "https://www.google.com")
        var urlRequest = URLRequest(url: url!)
        urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("1", forHTTPHeaderField: "Content-Length")
        let httpHeaderFields = ["Content-Type": "application/x-www-form-urlencoded; charset=utf-8", "Content-Length": "1"]
        let urlRequestWithStringAndHTTPHeaderFields = URLRequest(string: "https://www.google.com", httpHeaderFields: httpHeaderFields)
        XCTAssertEqual(urlRequest, urlRequestWithStringAndHTTPHeaderFields)
    }

}
