//
//  CGImageRoundTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/2/1.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageRoundTests: XCTestCase {

    func testRoundHorizontal() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: true, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }
        guard let round = cgImage.round else {
            XCTFail("Failed to create the round image.")
            return
        }
        XCTAssertEqual(round.width, 32)
        XCTAssertEqual(round.height, 32)
    }

    func testRoundVertical() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: false, size: CGSize(width: 32, height: 64)) else {
            XCTFail("Failed to create the image.")
            return
        }
        guard let round = cgImage.round else {
            XCTFail("Failed to create the round image.")
            return
        }
        XCTAssertEqual(round.width, 32)
        XCTAssertEqual(round.height, 32)
    }

    func testRoundLoad() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "icon", ofType: "png") else { return }
        let image = UIImage(contentsOfFile: path)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }
        guard let round = cgImage.round else {
            XCTFail("Failed to create the round image.")
            return
        }
        XCTAssertEqual(round.width, 66)
        XCTAssertEqual(round.height, 66)
    }
}
