//
//  NSAttributedString+Formatting.swift
//  SExtensions
//
//  Created by Ray on 2018/6/10.
//  Copyright © 2018 Ray. All rights reserved.
//

import UIKit

public extension NSAttributedString {

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is having a color.
    ///
    /// - Parameter color: text color.
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it has the color; otherwise, `false`.
    func isHavingColor(_ color: UIColor, in range: NSRange? = nil) -> Bool {
        let checkRange = range ?? NSRange(location: 0, length: string.count)
        let option = NSAttributedString.EnumerationOptions(rawValue: 0)
        var isHavingColor = false
        enumerateAttribute(.foregroundColor, in: checkRange, options: option, using: { (value: Any, range: NSRange, _) in
            if range.location == checkRange.location, range.length == checkRange.length, let foregroundColor = value as? UIColor, foregroundColor == color {
                isHavingColor = true
            }
        })
        return isHavingColor
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is using a font.
    ///
    /// - Parameter font: text font.
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it has the color; otherwise, `false`.
    func isUsingFont(_ font: UIFont, in range: NSRange? = nil) -> Bool {
        let checkRange = range ?? NSRange(location: 0, length: string.count)
        let option = NSAttributedString.EnumerationOptions(rawValue: 0)
        var isUsingFont = false
        enumerateAttribute(.font, in: checkRange, options: option, using: { (value: Any, range: NSRange, _) in
            if range.location == checkRange.location, range.length == checkRange.length, let currentFont = value as? UIFont, currentFont == font {
                isUsingFont = true
            }
        })
        return isUsingFont
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is underlined.
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it is underlined; otherwise, `false`.
    func isUnderlined(in range: NSRange? = nil) -> Bool {
        let checkRange = range ?? NSRange(location: 0, length: string.count)
        let option = NSAttributedString.EnumerationOptions(rawValue: 0)
        var isUnderlined = false
        enumerateAttribute(.underlineStyle, in: checkRange, options: option, using: { (value: Any, range: NSRange, _) in
            if range.location == checkRange.location, range.length == checkRange.length, let underline = (value as? Int), underline == NSUnderlineStyle.styleSingle.rawValue {
                isUnderlined = true
            }
        })
        return isUnderlined
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is highlighted.
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it is highlighted; otherwise, `false`.
    func isHighlighted(with color: UIColor, in range: NSRange? = nil) -> Bool {
        let checkRange = range ?? NSRange(location: 0, length: string.count)
        let option = NSAttributedString.EnumerationOptions(rawValue: 0)
        var isHighlighted = false
        enumerateAttribute(.backgroundColor, in: checkRange, options: option, using: { (value: Any, range: NSRange, _) in
            if range.location == checkRange.location, range.length == checkRange.length, let highlightColor = value as? UIColor, highlightColor == color {
                isHighlighted = true
            }
        })
        return isHighlighted
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is using strikethrough.
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it is using strikethrough; otherwise, `false`.
    func isStrikethrough(in range: NSRange? = nil) -> Bool {
        let checkRange = range ?? NSRange(location: 0, length: string.count)
        let option = NSAttributedString.EnumerationOptions(rawValue: 0)
        var isStrikethrough = false
        enumerateAttribute(.strikethroughStyle, in: checkRange, options: option, using: { (value: Any, range: NSRange, _) in
            if range.location == checkRange.location, range.length == checkRange.length, let strikethrough = value as? NSNumber, strikethrough == NSNumber.init(value: 1) {
                isStrikethrough = true
            }
        })
        return isStrikethrough
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is using traits.
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it is using traits; otherwise, `false`.
    func isUsingTraits(_ traits: UIFontDescriptorSymbolicTraits, in range: NSRange? = nil) -> Bool {
        let checkRange = range ?? NSRange(location: 0, length: string.count)
        let option = NSAttributedString.EnumerationOptions(rawValue: 0)
        var usingTraitsLength = 0
        enumerateAttribute(.font, in: checkRange, options: option, using: { (value: Any, range: NSRange, _) in
            if let currentFont = value as? UIFont, currentFont.fontDescriptor.symbolicTraits.contains(traits) {
                usingTraitsLength += range.length
            }
        })
        return usingTraitsLength == checkRange.length
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is bold.
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it is bold; otherwise, `false`.
    func isBold(in range: NSRange? = nil) -> Bool {
        return isUsingTraits(.traitBold, in: range)
    }

    /// Returns a Boolean value that indicates whether the text within a NSRange
    /// is italic.
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: `true` if it is italic; otherwise, `false`.
    func isItalic(in range: NSRange? = nil) -> Bool {
        return isUsingTraits(.traitItalic, in: range)
    }

}
