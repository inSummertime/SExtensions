//
//  DispatchSourceTimerTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/8.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DispatchSourceTimerTests: XCTestCase {

    var timerRepeating: DispatchSourceTimer?
    var timerNoRepeating: DispatchSourceTimer?

    func testTimerRepeating() {
        var number = 1
        let expectation = self.expectation(description: "Number should be 2")
        let queue = DispatchQueue.main
        timerRepeating = DispatchSource.timer(delay: 1.0, interval: 1.0, isRepeating: true, queue: queue) { timer in
            number += 1
            if number > 3 {
                timer.cancel()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                XCTFail("error: \(error)")
            }
            XCTAssertTrue(number == 4)
        }
    }

    func testTimerNoRepeating() {
        var number = 1
        let expectation = self.expectation(description: "Number should be 2")
        let queue = DispatchQueue.main
        timerNoRepeating = DispatchSource.timer(delay: 1.0, interval: 1.0, isRepeating: false, queue: queue) { _ in
            number += 1
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                XCTFail("error: \(error)")
            }
            XCTAssertTrue(number == 2)
            self.timerNoRepeating?.cancel()
        }
    }

}
