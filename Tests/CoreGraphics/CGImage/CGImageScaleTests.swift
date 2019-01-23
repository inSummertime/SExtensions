//
//  CGImageScaleTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/22.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageScaleTests: XCTestCase {

    var cgImage: CGImage!
    var scale: CGFloat!

    override func setUp() {
        let size = CGSize(width: 32, height: 64)
        let view = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        view.layer.addBorder(color: .black, width: 1)
        view.layer.render(in: context)
        cgImage = context.makeImage()
        guard let image = context.makeImage() else {
            XCTFail("Failed to return an image containing a snapshot of the bitmap context.")
            return
        }
        cgImage = image
        guard let scaleFactor = UIGraphicsGetImageFromCurrentImageContext()?.scale else {
            XCTFail("Failed to get The scale factor of the image.")
            return
        }
        scale = scaleFactor
    }

    func testScaleZero() {
        XCTAssertNil(cgImage.scaleBy(0))
        XCTAssertNil(cgImage.scaleBy(-1))
    }

    func testScaleOne() {
        guard let newImage = cgImage.scaleBy(1) else {
            XCTFail("Failed to scale.")
            return
        }
        XCTAssertEqual(newImage.width, Int(32 * scale))
        XCTAssertEqual(newImage.height, Int(64 * scale))
    }

    func testScaleHalf() {
        guard let newImage = cgImage.scaleBy(0.5) else {
            XCTFail("Failed to scale.")
            return
        }
        XCTAssertEqual(newImage.width, Int(16 * scale))
        XCTAssertEqual(newImage.height, Int(32 * scale))
    }

    func testScaleDouble() {
        guard let newImage = cgImage.scaleBy(2) else {
            XCTFail("Failed to scale.")
            return
        }
        XCTAssertEqual(newImage.width, Int(64 * scale))
        XCTAssertEqual(newImage.height, Int(128 * scale))
    }
}
