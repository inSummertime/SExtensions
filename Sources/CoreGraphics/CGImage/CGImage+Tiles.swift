//
//  CGImage+Tiles.swift
//  SExtensions
//
//  Created by Ray on 2019/2/3.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics

public extension CGImage {

    func splitingToTiles(rows: Int, columns: Int) -> [[CGImage]]? {
        guard rows > 0, columns > 0 else { return nil }
        var tiles = Array(repeating: Array(repeating: self, count: columns), count: rows)
        let tileWidth = CGFloat(width) / CGFloat(columns)
        let tileHeight = CGFloat(height) / CGFloat(rows)
        var positionX: CGFloat = 0
        var positionY: CGFloat = 0
        for row in 0 ..< rows {
            positionX = 0
            for column in 0 ..< columns {
                let rect = CGRect(x: positionX, y: positionY, width: tileWidth, height: tileHeight)
                if let tile = cropping(to: rect) {
                    tiles[row][column] = tile
                }
                positionX += tileWidth
            }
            positionY += tileHeight
        }
        return tiles
    }
}
