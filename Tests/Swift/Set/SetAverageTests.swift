//
//  SetAverageTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/5.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class SetAverageTests: XCTestCase {

    func testAverage() {
        let set: Set = [0, 1, 2]
        XCTAssertEqual(set.average, 1.0)
        let setBinaryLiterals: Set = [0b0, 0b1, 0b10]
        XCTAssertEqual(setBinaryLiterals.average, 1.0)
        let setOctalLiterals: Set = [0o0, 0o1, 0o2]
        XCTAssertEqual(setOctalLiterals.average, 1.0)
        let setHexadecimalLiterals: Set = [0x0, 0x1, 0x2]
        XCTAssertEqual(setHexadecimalLiterals.average, 1.0)
        let setDouble: Set = [0.0, 1.1, 2.2]
        XCTAssertEqual(setDouble.average, 1.1)
        let setFloat: Set = [Float(0), Float(1.1), Float(2.2)]
        XCTAssertEqual(setFloat.average, 1.1)
        let setDuplicated: Set = [0, 1, 2, 2]
        XCTAssertEqual(setDuplicated.total, 3)
        XCTAssertEqual(setDuplicated.count, 3)
        XCTAssertEqual(setDuplicated.average, 1.0)
    }
}
