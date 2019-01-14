//
//  NSAttributedStringFormattingTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/10.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class NSAttributedStringFormattingTests: XCTestCase {

    func testIsHavingColor() {
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.foregroundColor: UIColor.white])
        XCTAssertTrue(helloWorld.isHavingColor(.white))
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isHavingColor(.white, in: range))

        let hello = NSAttributedString(string: "Hello ", attributes: [.foregroundColor: UIColor.white])
        let world = NSAttributedString(string: "world!", attributes: [.foregroundColor: UIColor.black])
        let helloWorldConcatenated = hello + world
        XCTAssertFalse(helloWorldConcatenated.isHavingColor(.white))
        XCTAssertFalse(helloWorldConcatenated.isHavingColor(.black))
        let helloRange = NSRange(location: 0, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isHavingColor(.white, in: helloRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isHavingColor(.black, in: worldRange))
    }

    func testIsUsingFont() {
        let font8 = UIFont.systemFont(ofSize: 8.0)
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.font: font8])
        XCTAssertTrue(helloWorld.isUsingFont(font8))
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isUsingFont(font8, in: range))

        let font16 = UIFont.systemFont(ofSize: 16.0)
        let hello = NSAttributedString(string: "Hello ", attributes: [.font: font8])
        let world = NSAttributedString(string: "world!", attributes: [.font: font16])
        let helloWorldConcatenated = hello + world
        XCTAssertFalse(helloWorldConcatenated.isUsingFont(font8))
        XCTAssertFalse(helloWorldConcatenated.isUsingFont(font16))
        let helloRange = NSRange(location: 0, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isUsingFont(font8, in: helloRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isUsingFont(font16, in: worldRange))
    }

    func testIsUnderlined() {
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.underlineStyle: true])
        XCTAssertTrue(helloWorld.isUnderlined())
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isUnderlined(in: range))

        let hello = NSAttributedString(string: "Hello ", attributes: [.underlineStyle: true])
        let world = NSAttributedString(string: "world!", attributes: [.underlineStyle: false])
        let helloWorldConcatenated = hello + world
        XCTAssertFalse(helloWorldConcatenated.isUnderlined())
        let helloRange = NSRange(location: 0, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isUnderlined(in: helloRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertFalse(helloWorldConcatenated.isUnderlined(in: worldRange))
    }

    func testIsHighlighted() {
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.backgroundColor: UIColor.white])
        XCTAssertTrue(helloWorld.isHighlighted(with: .white))
        XCTAssertFalse(helloWorld.isHighlighted(with: .black))
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isHighlighted(with: .white, in: range))

        let hello = NSAttributedString(string: "Hello", attributes: [.backgroundColor: UIColor.white])
        let whitespace = NSAttributedString(string: " ")
        let world = NSAttributedString(string: "world!", attributes: [.backgroundColor: UIColor.black])
        let helloWorldConcatenated = hello + whitespace + world
        XCTAssertFalse(helloWorldConcatenated.isHighlighted(with: .white))
        let helloRange = NSRange(location: 0, length: 5)
        XCTAssertTrue(helloWorldConcatenated.isHighlighted(with: .white, in: helloRange))
        let whitespaceRange = NSRange(location: 6, length: 1)
        XCTAssertFalse(helloWorldConcatenated.isHighlighted(with: .white, in: whitespaceRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isHighlighted(with: .black, in: worldRange))
    }

    func testIsStrikethrough() {
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.strikethroughStyle: true])
        XCTAssertTrue(helloWorld.isStrikethrough())
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isStrikethrough(in: range))

        let hello = NSAttributedString(string: "Hello ", attributes: [.strikethroughStyle: true])
        let world = NSAttributedString(string: "world!", attributes: [.strikethroughStyle: false])
        let helloWorldConcatenated = hello + world
        XCTAssertFalse(helloWorldConcatenated.isStrikethrough())
        let helloRange = NSRange(location: 0, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isStrikethrough(in: helloRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertFalse(helloWorldConcatenated.isStrikethrough(in: worldRange))
    }

    func testIsBold() {
        let boldFont8 = UIFont.boldSystemFont(ofSize: 8.0)
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.font: boldFont8])
        XCTAssertTrue(helloWorld.isBold())
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isBold(in: range))

        let font8 = UIFont.systemFont(ofSize: 8.0)
        let hello = NSAttributedString(string: "Hello ", attributes: [.font: boldFont8])
        let world = NSAttributedString(string: "world!", attributes: [.font: font8])
        let helloWorldConcatenated = hello + world
        XCTAssertFalse(helloWorldConcatenated.isBold())
        let helloRange = NSRange(location: 0, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isBold(in: helloRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertFalse(helloWorldConcatenated.isBold(in: worldRange))
    }

    func testIsItalic() {
        let italicFont8 = UIFont.italicSystemFont(ofSize: 8.0)
        let helloWorld = NSAttributedString(string: "Hello world!", attributes: [.font: italicFont8])
        XCTAssertTrue(helloWorld.isItalic())
        let range = NSRange(location: 0, length: 1)
        XCTAssertTrue(helloWorld.isItalic(in: range))

        let font8 = UIFont.systemFont(ofSize: 8.0)
        let hello = NSAttributedString(string: "Hello ", attributes: [.font: italicFont8])
        let world = NSAttributedString(string: "world!", attributes: [.font: font8])
        let helloWorldConcatenated = hello + world
        XCTAssertFalse(helloWorldConcatenated.isItalic())
        let helloRange = NSRange(location: 0, length: 6)
        XCTAssertTrue(helloWorldConcatenated.isItalic(in: helloRange))
        let worldRange = NSRange(location: 6, length: 6)
        XCTAssertFalse(helloWorldConcatenated.isItalic(in: worldRange))
    }
}
