//
//  DispatchQueueDelayTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DispatchQueueDelayTests: XCTestCase {
    
    var start = 1
    
    func testDelay() {
        let expectation = self.expectation(description: "StartShouldBeTwo")
        DispatchQueue.main.delay(1.0) {
            self.start += 1
        }
        XCTAssertTrue(start == 1)
        perform(#selector(then(_:)), with: expectation, afterDelay: 2.0)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func then(_ expectation: XCTestExpectation) {
        XCTAssertTrue(start == 2)
        expectation.fulfill()
    }
    
}
