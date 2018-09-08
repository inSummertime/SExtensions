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
    
    var start = 1
    var timer: DispatchSourceTimer?
    
    func testTimer() {
        let expectation = self.expectation(description: "StartShouldBeTwo")
        timer = DispatchSource.timer(delay: 1.0, interval: 1.0, isRepeating: true, queue: .main) {
            self.start += 1
        }
        perform(#selector(then(_:)), with: expectation, afterDelay: 3.0)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func then(_ expectation: XCTestExpectation) {
        XCTAssertTrue(start == 3)
        expectation.fulfill()
        timer?.cancel()
    }
    
}
