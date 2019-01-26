//
//  CGColorIsKindOfTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/26.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGColorIsKindOfTests: XCTestCase {

    func testIsKindOf() {
        let white = UIColor(red: 0.994, green: 0.994, blue: 0.994, alpha: 1).cgColor
        XCTAssertFalse(white.isKind(of: UIColor.white.cgColor, maximumFractionDigits: -1))
        XCTAssertTrue(white.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 0))
        XCTAssertTrue(white.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 1))
        XCTAssertFalse(white.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 2))
        XCTAssertFalse(white.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 3))
    }

    func testIsKindOfCMYK() {
        let components: [CGFloat] = [0.760, 0.706, 0.643, 0.871, 1.0]
        guard let black = CGColor(colorSpace: CGColorSpaceCreateDeviceCMYK(), components: components) else {
            XCTFail("Failed to create the color.")
            return
        }
        XCTAssertFalse(black.isKind(of: UIColor.black.cgColor, maximumFractionDigits: -1))
        XCTAssertTrue(black.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 0))
        XCTAssertTrue(black.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 1))
        XCTAssertFalse(black.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 2))
        XCTAssertFalse(black.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 3))
    }
}
