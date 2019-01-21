//
//  CGImageRotateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/20.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageRotateTests: XCTestCase {
    
    var cgImage: CGImage!
    
    override func setUp() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "icon", ofType: "png") else { return }
        let image = UIImage(contentsOfFile: path)
        cgImage = image?.cgImage
    }

    func testRotate90DegreesClockwise() {
        guard let rotated = cgImage.rotate(degrees: -90) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 78)
        XCTAssertEqual(rotated.height, 66)
    }
    
    func testRotate180DegreesClockwise() {
        guard let rotated = cgImage.rotate(degrees: -180) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 66)
        XCTAssertEqual(rotated.height, 78)
    }
    
    func testRotate90DegreesCounterclockwise() {
        guard let rotated = cgImage.rotate(degrees: 90) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 78)
        XCTAssertEqual(rotated.height, 66)
    }
    
    func testRotate180DegreesCounterclockwise() {
        guard let rotated = cgImage.rotate(degrees: 180) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 66)
        XCTAssertEqual(rotated.height, 78)
    }
    
    func testRotate270DegreesCounterclockwise() {
        guard let rotated = cgImage.rotate(degrees: 270) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 78)
        XCTAssertEqual(rotated.height, 66)
    }
    
    func testRotate360DegreesCounterclockwise() {
        guard let rotated = cgImage.rotate(degrees: 360) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 66)
        XCTAssertEqual(rotated.height, 78)
    }
    
    func testRotate45DegreesCounterclockwise() {
        guard let rotated = cgImage.rotate(degrees: 45) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 101)
        XCTAssertEqual(rotated.height, 101)
    }
    
    func testRotate45DegreesClockwise() {
        guard let rotated = cgImage.rotate(degrees: -45) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 101)
        XCTAssertEqual(rotated.height, 101)
    }
    
    func testRotate135DegreesCounterclockwise() {
        guard let rotated = cgImage.rotate(degrees: 135) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 101)
        XCTAssertEqual(rotated.height, 101)
    }
    
    func testRotate135DegreesClockwise() {
        guard let rotated = cgImage.rotate(degrees: -135) else {
            XCTFail("Faild to rotate the image.")
            return
        }
        XCTAssertEqual(rotated.width, 101)
        XCTAssertEqual(rotated.height, 101)
    }

}
