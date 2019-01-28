//
//  CGImageCreateWithColorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/28.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageCreateWithColorTests: XCTestCase {

    func testCreateWithColor() {
        guard let cgImage = CGImage.createWithColor(.white, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }
        XCTAssertEqual(cgImage.width, 64)
        XCTAssertEqual(cgImage.height, 32)
        let x = CGFloat.random(in: CGFloat(0) ..< CGFloat(cgImage.width))
        let y = CGFloat.random(in: CGFloat(0) ..< CGFloat(cgImage.height))
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: x, y: y))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
    }
}
