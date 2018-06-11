//
//  String+Height.swift
//  SExtensions
//
//  Created by Ray on 2018/6/8.
//  Copyright © 2018 Ray. All rights reserved.
//

import UIKit

public extension String {
    
    /// Returns height based on a given width and font
    ///
    ///     print("Hello world!".height(withConstrainedWidth: .greatestFiniteMagnitude, font: UIFont.systemFont(ofSize: 16.0)) == font.lineHeight)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - height: constrained width
    ///   - font: font
    /// - Returns: height
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let minWidth = max(font.pointSize, width)
        let constraintRect = CGSize(width: minWidth, height: .greatestFiniteMagnitude)
        let rect = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return rect.height
    }
    
}
