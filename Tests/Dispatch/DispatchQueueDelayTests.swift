//
//  DispatchQueueDelayTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/7.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DispatchQueueDelayTests: XCTestCase {

    func testDelay() {
        var start = 1
        let expectation = self.expectation(description: "StartShouldBeTwo")
        DispatchQueue.main.delay(1.0) {
            start += 1
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0) { error in
            if let error = error {
                XCTFail("error: \(error)")
            }
            XCTAssertTrue(start == 2)
        }
    }
}
