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
    let queue = DispatchQueue.global(qos: .background)
    
    func testTimer() {
        let expectation = self.expectation(description: "NumberShouldBe3")
        timer = DispatchSource.timer(delay: 1.0, interval: 1.0, isRepeating: true, queue: queue) { timer in
            self.number += 1
            if self.number > 3 {
                timer.suspend()
            }
        }
        queue.sync {
            self.perform(#selector(self.then(_:)), with: expectation, afterDelay: 5.0)
            self.wait(for: [expectation], timeout: 5.0)
        }
    }
    
    func then(_ expectation: XCTestExpectation) {
        XCTAssertTrue(number == 4)
        expectation.fulfill()
        self.timer?.cancel()
    }
    
}
