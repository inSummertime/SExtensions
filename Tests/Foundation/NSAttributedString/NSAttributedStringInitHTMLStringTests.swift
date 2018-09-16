//
//  NSAttributedStringInitHTMLStringTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class NSAttributedStringInitHTMLStringTests: XCTestCase {
    
    func testInitHTMLString() {
        let html = "<span><strong><i>Hello world!</i></strong></span>"
        do {
            let attributedString = try NSAttributedString(htmlString: html)
            XCTAssertEqual(attributedString.string, "Hello world!")
        } catch {
            XCTFail()
        }
    }
    
}
