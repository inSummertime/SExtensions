//
//  NSMutableAttributedStringFormatTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/11.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class NSMutableAttributedStringFormatTests: XCTestCase {
    
    func testColored() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.foregroundColor: UIColor.white])
        let blackHelloWorld = helloWorld.colored(with: .black)
        XCTAssertTrue(blackHelloWorld.isHavingColor(.black))
        let range = NSRange(location: 0, length: 1)
        let mixedHelloWorld = blackHelloWorld.colored(with: .clear, in: range)
        XCTAssertFalse(mixedHelloWorld.isHavingColor(.black))
        XCTAssertTrue(mixedHelloWorld.isHavingColor(.clear, in: range))
    }
    
    func testColor() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.foregroundColor: UIColor.white])
        helloWorld.color(with: .black)
        XCTAssertTrue(helloWorld.isHavingColor(.black))
        let range = NSRange(location: 0, length: 1)
        helloWorld.color(with: .clear, in: range)
        XCTAssertFalse(helloWorld.isHavingColor(.black))
        XCTAssertTrue(helloWorld.isHavingColor(.clear, in: range))
    }
    
    func testUsingFont() {
        let font8 = UIFont.systemFont(ofSize: 8.0)
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: font8])
        let font16 = UIFont.systemFont(ofSize: 16.0)
        let helloWorldFont16 = helloWorld.usingFont(font16)
        XCTAssertTrue(helloWorldFont16.isUsingFont(font16))
        let range = NSRange(location: 0, length: 1)
        let mixedHelloWorld = helloWorldFont16.usingFont(font8, in: range)
        XCTAssertFalse(mixedHelloWorld.isUsingFont(font8))
        XCTAssertTrue(mixedHelloWorld.isUsingFont(font8, in: range))
    }
    
    func testUseFont() {
        let font8 = UIFont.systemFont(ofSize: 8.0)
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: font8])
        let font16 = UIFont.systemFont(ofSize: 16.0)
        helloWorld.useFont(font16)
        XCTAssertTrue(helloWorld.isUsingFont(font16))
        let range = NSRange(location: 0, length: 1)
        helloWorld.useFont(font8, in: range)
        XCTAssertFalse(helloWorld.isUsingFont(font8))
        XCTAssertTrue(helloWorld.isUsingFont(font8, in: range))
    }
    
    func testUnderlined() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!")
        XCTAssertTrue(helloWorld.underlined().isUnderlined())
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.underlined(in: range).isUnderlined())
        XCTAssertTrue(helloWorld.underlined(in: range).isUnderlined(in: range))
    }
    
    func testUnderline() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!")
        let range = NSRange(location: 0, length: 1)
        helloWorld.underline(in: range)
        XCTAssertFalse(helloWorld.isUnderlined())
        XCTAssertTrue(helloWorld.isUnderlined(in: range))
        helloWorld.underline()
        XCTAssertTrue(helloWorld.isUnderlined())
    }
    
    func testRemovingUnderline() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.underlineStyle: true])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.removingUnderline(in: range).isUnderlined())
        XCTAssertFalse(helloWorld.removingUnderline(in: range).isUnderlined(in: range))
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.removingUnderline(in: range).isUnderlined(in: anotherRange))
        XCTAssertFalse(helloWorld.removingUnderline().isUnderlined())
    }
    
    func testRemoveUnderline() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.underlineStyle: true])
        let range = NSRange(location: 0, length: 1)
        helloWorld.removeUnderline(in: range)
        XCTAssertFalse(helloWorld.isUnderlined())
        XCTAssertFalse(helloWorld.isUnderlined(in: range))
        let anotherRange = NSRange(location: 1, length: 1)
        helloWorld.removeUnderline(in: range)
        XCTAssertTrue(helloWorld.isUnderlined(in: anotherRange))
        helloWorld.removeUnderline()
        XCTAssertFalse(helloWorld.isUnderlined())
    }
    
    func testHighlighted() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!")
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.highlighted(with: .white, in: range).isHighlighted(with: .white))
        XCTAssertTrue(helloWorld.highlighted(with: .white, in: range).isHighlighted(with: .white, in: range))
        XCTAssertTrue(helloWorld.highlighted(with: .black).isHighlighted(with: .black))
    }
    
    func testHighlight() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!")
        let range = NSRange(location: 0, length: 1)
        helloWorld.highlight(with: .white, in: range)
        XCTAssertFalse(helloWorld.isHighlighted(with: .white))
        XCTAssertTrue(helloWorld.isHighlighted(with: .white, in: range))
        helloWorld.highlight(with: .black)
        XCTAssertTrue(helloWorld.isHighlighted(with: .black))
    }
    
    func testUnhighlighted() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.backgroundColor: UIColor.white])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.unhighlighted(in: range).isHighlighted(with: .white))
        XCTAssertFalse(helloWorld.unhighlighted(in: range).isHighlighted(with: .white, in: range))
        XCTAssertFalse(helloWorld.unhighlighted().isHighlighted(with: .white))
    }
    
    func testUnhighlight() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.backgroundColor: UIColor.white])
        let range = NSRange(location: 0, length: 1)
        helloWorld.unhighlight(in: range)
        XCTAssertFalse(helloWorld.isHighlighted(with: .white))
        XCTAssertFalse(helloWorld.isHighlighted(with: .white, in: range))
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.isHighlighted(with: .white, in: anotherRange))
        helloWorld.unhighlight()
        XCTAssertFalse(helloWorld.isHighlighted(with: .white))
    }
    
    func testUsingStrikethrough() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!")
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.usingStrikethrough(in: range).isStrikethrough())
        XCTAssertTrue(helloWorld.usingStrikethrough(in: range).isStrikethrough(in: range))
        XCTAssertTrue(helloWorld.usingStrikethrough().isStrikethrough())
    }
    
    func testUseStrikethrough() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!")
        let range = NSRange(location: 0, length: 1)
        helloWorld.useStrikethrough(in: range)
        XCTAssertFalse(helloWorld.isStrikethrough())
        XCTAssertTrue(helloWorld.isStrikethrough(in: range))
        helloWorld.useStrikethrough()
        XCTAssertTrue(helloWorld.isStrikethrough())
    }
    
    func testRemovingStrikethrough() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.strikethroughStyle: true])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.removingStrikethrough(in: range).isStrikethrough())
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.removingStrikethrough(in: range).isStrikethrough(in: anotherRange))
        XCTAssertFalse(helloWorld.removingStrikethrough().isStrikethrough())
    }
    
    func testRemoveStrikethrough() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.strikethroughStyle: true])
        let range = NSRange(location: 0, length: 1)
        helloWorld.removeStrikethrough(in: range)
        XCTAssertFalse(helloWorld.isStrikethrough())
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.isStrikethrough(in: anotherRange))
        helloWorld.removeStrikethrough()
        XCTAssertFalse(helloWorld.isStrikethrough())
    }
    
    func testUsingBold() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.usingBold(in: range).isBold())
        XCTAssertTrue(helloWorld.usingBold(in: range).isBold(in: range))
        XCTAssertTrue(helloWorld.usingBold().isBold())
    }
    
    func testUseBold() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        helloWorld.useBold(in: range)
        XCTAssertFalse(helloWorld.isBold())
        XCTAssertTrue(helloWorld.isBold(in: range))
        helloWorld.useBold()
        XCTAssertTrue(helloWorld.isBold())
    }
    
    func testItalicized() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.italicized(in: range).isItalic())
        XCTAssertTrue(helloWorld.italicized(in: range).isItalic(in: range))
        XCTAssertTrue(helloWorld.italicized().isItalic())
    }
    
    func testItalicize() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        helloWorld.italicize(in: range)
        XCTAssertFalse(helloWorld.isItalic())
        XCTAssertTrue(helloWorld.isItalic(in: range))
        helloWorld.italicize()
        XCTAssertTrue(helloWorld.isItalic())
    }
    
    func testRemovingBold() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.boldSystemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.removingBold(in: range).isBold())
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.removingBold(in: range).isBold(in: anotherRange))
        XCTAssertFalse(helloWorld.removingBold().isBold())
    }
    
    func testRemoveBold() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.boldSystemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        helloWorld.removeBold(in: range)
        XCTAssertFalse(helloWorld.isBold())
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.isBold(in: anotherRange))
        helloWorld.removeBold()
        XCTAssertFalse(helloWorld.isBold())
    }
    
    func testRemovingItalic() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.italicSystemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        XCTAssertFalse(helloWorld.removingItalic(in: range).isItalic())
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.removingItalic(in: range).isItalic(in: anotherRange))
        XCTAssertFalse(helloWorld.removingItalic().isItalic())
    }
    
    func testRemoveItalic() {
        let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.italicSystemFont(ofSize: 8.0)])
        let range = NSRange(location: 0, length: 1)
        helloWorld.removeItalic(in: range)
        XCTAssertFalse(helloWorld.isItalic())
        let anotherRange = NSRange(location: 1, length: 1)
        XCTAssertTrue(helloWorld.isItalic(in: anotherRange))
        helloWorld.removeItalic()
        XCTAssertFalse(helloWorld.isItalic())
    }

}
