//
//  URLIsFromDomainTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/22.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class URLIsFromDomainTests: XCTestCase {

    func testIsFromDomain() {
        let baseURL = URL(string: "https://www.google.com")
        let url = URL(string: "search?q=iPhone", relativeTo: baseURL)!
        XCTAssertTrue(url.isFromDomain("google.com"))
        XCTAssertTrue(url.isFromDomain("www.google.com"))
        let absoluteURL = URL(string: "https://www.google.com/search?q=iPhone")!
        XCTAssertTrue(absoluteURL.isFromDomain("google.com"))
        XCTAssertTrue(absoluteURL.isFromDomain("www.google.com"))
        XCTAssertFalse(absoluteURL.isFromDomain("www.apple.com"))
    }
}
