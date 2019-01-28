//
//  CGImageCreateWithGradientTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/27.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageGradientTests: XCTestCase {

    func testCreateWithGradientHorizontal() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: true, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }
        XCTAssertEqual(cgImage.width, 64)
        XCTAssertEqual(cgImage.height, 32)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 0))?.cgColor.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 1), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 63, y: 0))?.cgColor.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 1), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 31))?.cgColor.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 1), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 63, y: 31))?.cgColor.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 1), true)
    }

    func testCreateWithGradientVertical() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: false, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }
        XCTAssertEqual(cgImage.width, 64)
        XCTAssertEqual(cgImage.height, 32)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 0))?.cgColor.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 1), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 63, y: 0))?.cgColor.isKind(of: UIColor.white.cgColor, maximumFractionDigits: 1), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 31))?.cgColor.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 1), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 63, y: 31))?.cgColor.isKind(of: UIColor.black.cgColor, maximumFractionDigits: 1), true)
    }
}
