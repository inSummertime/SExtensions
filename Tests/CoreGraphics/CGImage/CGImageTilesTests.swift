//
//  CGImageTilesTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/2/3.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageTilesTests: XCTestCase {

    func testSplitingToTiles() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: true, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }
        guard let tiles = cgImage.splitingToTiles(rows: 8, columns: 4) else {
            XCTFail("Failed to create the tiles.")
            return
        }
        XCTAssertEqual(tiles.count, 8)
        let lastRow = tiles[7]
        XCTAssertEqual(tiles.count, 8)
        let lastTile = lastRow[3]
        XCTAssertEqual(lastTile.width, 16)
        XCTAssertEqual(lastTile.height, 4)
    }

    func testSplitingToTilesLoad() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "icon", ofType: "png") else { return }
        let image = UIImage(contentsOfFile: path)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }
        guard let tiles = cgImage.splitingToTiles(rows: 13, columns: 6) else {
            XCTFail("Failed to create the tiles.")
            return
        }
        XCTAssertEqual(tiles.count, 13)
        let row = Int.random(in: 0 ..< 13)
        let column = Int.random(in: 0 ..< 6)
        let randomTitle = tiles[row][column]
        XCTAssertEqual(randomTitle.width, 11)
        XCTAssertEqual(randomTitle.height, 6)
    }
}
