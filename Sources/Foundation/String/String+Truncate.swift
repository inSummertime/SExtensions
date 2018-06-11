//
//  String+Truncate.swift
//  SExtensions
//
//  Created by Ray on 2018/6/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import UIKit

public extension String {
    
    /// Returns a string truncated to index with a trialing string.
    ///
    ///     print("Hello world!".truncated(toIndex: 6))
    ///     // Prints "Hello w..."
    ///
    /// - Parameters:
    ///   - index: to index.
    ///   - trailing: trailing string.
    /// - Returns: a truncated string.
    func truncated(toIndex index: Int, trailing: String? = "...") -> String {
        if index < 0 {
            return ""
        }
        if index >= count {
            return self
        }
        return (self[safeTo: index] ?? "") + (trailing ?? "")
    }
    
    /// Returns a string truncated to length with a trailing string.
    ///
    ///     print("Hello world!".truncated(toLength: 6))
    ///     // Prints "Hello ..."
    ///
    /// - Parameters:
    ///   - length: the length of the string.
    ///   - trailing: trailing string.
    /// - Returns: a truncated string.
    func truncated(toLength length: Int, trailing: String? = "...") -> String {
        return truncated(toIndex: length - 1, trailing: trailing)
    }
    
    /// Returns a string with a optional trailing with a constrained width, number of lines and font.
    ///
    ///     print("Hello world!".truncated(withConstrained: 16.0, font: font, numberOfLines: 2))
    ///     // Prints "Hello ..."
    ///
    /// - Parameters:
    ///   - width: limited width.
    ///   - font: font.
    ///   - numberOfLines: number of lines.
    ///   - trailing: trailing string.
    /// - Returns: a truncated string.
    func truncated(withConstrained width: CGFloat, font: UIFont, numberOfLines: Int, trailing: String? = "...") -> String {
        let minWidth = max(width, font.pointSize)
        if self.size(withAttributes: [.font: font]).width < minWidth {
            return self
        }
        let lineCount = max(1, numberOfLines)
        let tail = trailing ?? ""
        var i = count
        if lineCount == 1 {
            repeat {
                i -= 1
            } while (((self[safeTo: i] ?? "") + tail) as NSString).size(withAttributes: [.font: font]).width > minWidth && i > 0
        } else {
            if self.height(withConstrainedWidth: minWidth, font: font) <= font.lineHeight * CGFloat(lineCount) {
                return self
            }
            repeat {
                i -= 1
            } while ((self[safeTo: i] ?? "") + tail).height(withConstrainedWidth: minWidth, font: font) > font.lineHeight * CGFloat(lineCount) && i > 0
        }
        if i == 0 {
            return tail
        }
        return (self[safeTo: i] ?? "") + tail
    }
    
    /// Returns a string with a optional trailing with a constrained size and font.
    ///
    ///     print("Hello world!".truncated(withConstrained: CGSize(width: 4.0, height: 4.0), font: UIFont.systemFont(ofSize: 8.0))
    ///     // Prints "..."
    ///
    /// - Parameters:
    ///   - size: a CGSize.
    ///   - font: font.
    ///   - trailing: trailing string.
    /// - Returns: a truncated string.
    func truncated(withConstrained size: CGSize, font: UIFont, trailing: String? = "...") -> String {
        if self.size(withAttributes: [.font: font]).width < size.width {
            return self
        }
        let tail = trailing ?? ""
        if size.height < font.lineHeight {
            return tail
        }
        var i = count
        repeat {
            i -= 1
        } while ((self[safeTo: i] ?? "") + tail).height(withConstrainedWidth: size.width, font: font) > max(size.height, font.lineHeight) && i > 0
        if i == count - 1 {
            return self
        }
        if i == 0 {
            return tail
        }
        return (self[safeTo: i] ?? "") + tail
    }
    
}
