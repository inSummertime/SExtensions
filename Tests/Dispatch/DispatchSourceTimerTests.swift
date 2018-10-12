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
    
    var timer: DispatchSourceTimer?
    
    func testTimer() {
        var number = 1
        let expectation = self.expectation(description: "NumberShouldBe4")
        let queue = DispatchQueue.global(qos: .background)
        timer = DispatchSource.timer(delay: 1.0, interval: 1.0, isRepeating: true, queue: queue) { timer in
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
    
}
