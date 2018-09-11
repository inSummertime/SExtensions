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
    
    var number = 1
    var timer: DispatchSourceTimer?
    
    func testTimer() {
        let expectation = self.expectation(description: "NumberShouldBe3")
        let queue = DispatchQueue.global(qos: .background)
        timer = DispatchSource.timer(delay: 1.0, interval: 1.0, isRepeating: true, queue: queue) {
            self.number += 1
        }
        queue.sync {
            self.perform(#selector(self.then(_:)), with: expectation, afterDelay: 3.0)
            self.wait(for: [expectation], timeout: 3.0)
        }
    }
    
    func then(_ expectation: XCTestExpectation) {
        XCTAssertTrue(number == 3)
        expectation.fulfill()
        timer?.cancel()
    }
    
}
