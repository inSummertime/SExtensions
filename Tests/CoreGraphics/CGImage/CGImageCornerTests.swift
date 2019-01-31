//
//  CGImageCornerTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/31.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageCornerTests: XCTestCase {

    func testAddRoundCorners() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: false, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }
        guard let newCGImage = cgImage.addRoundCorners(radius: 8) else {
            XCTFail("Failed to add round corners.")
            return
        }
        XCTAssertEqual(newCGImage.width, 64)
        XCTAssertEqual(newCGImage.height, 32)
    }

    func testAddRoundCornersLoad() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "icon", ofType: "png") else { return }
        guard let cgImage = UIImage(contentsOfFile: path)?.cgImage else {
            XCTFail("Failed to loat the image.")
            return
        }
        guard let newCGImage = cgImage.addRoundCorners(radius: 33) else {
            XCTFail("Failed to add round corners.")
            return
        }
        XCTAssertEqual(newCGImage.width, 66)
        XCTAssertEqual(newCGImage.height, 78)
    }
}
