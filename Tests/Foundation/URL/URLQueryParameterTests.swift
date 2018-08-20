//
//  URLQueryParameterTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class URLQueryParameterTests: XCTestCase {
    
    func testQueryParameters() {
        var url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
        let queryParameters = url?.queryParameters
        XCTAssertEqual(queryParameters!["q"], "iPhone")
        XCTAssertEqual(queryParameters!["source"], "lnt")
        XCTAssertEqual(queryParameters!["oq"], "")
        url?.queryParameters = ["q": "iPad"]
        XCTAssertEqual(url?.absoluteString, "https://www.google.com/search?q=iPad")
    }
    
    func testQueryParameterValue() {
        let url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
        XCTAssertEqual(url?.queryParameterValue(for: "q"), "iPhone")
        XCTAssertEqual(url?.queryParameterValue(for: "source"), "lnt")
        XCTAssertEqual(url?.queryParameterValue(for: "oq"), "")
    }
    
    func testUpdateQueryParameterValue() {
        var url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
        url?.updateQueryParameterValue("iPad", for: "q")
        XCTAssertEqual(url?.queryParameterValue(for: "q"), "iPad")
        url?.updateQueryParameterValue("X", for: "sa")
        XCTAssertEqual(url?.queryParameterValue(for: "sa"), "X")
    }
    
    func testRemoveQueryParameterValue() {
        var url = URL(string: "https://www.google.com/search?q=iPhone&source=lnt&oq=")
        url?.removeQueryParameterValue(forKey: "source")
        XCTAssertNil(url?.queryParameterValue(for: "source"))
        print(url?.queryParameterValue(for: "source"))
        url?.removeQueryParameterValue(forKey: "oq")
        XCTAssertNil(url?.queryParameterValue(for: "oq"))
        XCTAssertEqual(url?.absoluteString, "https://www.google.com/search?q=iPhone")
    }
    
}
