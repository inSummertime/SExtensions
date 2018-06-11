//
//  NSMutableAttributedString+Format.swift
//  SExtensions
//
//  Created by Ray on 2018/6/11.
//  Copyright © 2018 Ray. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString {
    
    /// Returns a NSMutableAttributedString with a color within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.foregroundColor: UIColor.white])
    ///     print(helloWorld.colored(with: .black).isHavingColor(.black))
    ///     // Prints "true"
    ///
    /// - Parameter color: text color.
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString with a color.
    func colored(with color: UIColor, in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.foregroundColor, value: color, range: replacementRange)
        return mutableAttributedString
    }
    
    /// Colors the NSMutableAttributedString within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.foregroundColor: UIColor.white])
    ///     helloWorld.color(with: .black)
    ///     print(helloWorld.isHavingColor(.black))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - color: text color.
    ///   - range: the NSRange of the text.
    func color(with color: UIColor, in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.foregroundColor, value: color, range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with a font within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     print(helloWorld.usingFont(UIFont.systemFont(ofSize: 16.0)).isUsingFont(font16))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - font: the font.
    ///   - range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func usingFont(_ font: UIFont, in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.font, value: font, range: replacementRange)
        return mutableAttributedString
    }
    
    /// Uses a font within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: font8])
    ///     helloWorld.useFont(UIFont.systemFont(ofSize: 16.0))
    ///     print(helloWorld.isUsingFont(font16))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - font: the font.
    ///   - range: the NSRange of the text.
    func useFont(_ font: UIFont, in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.font, value: font, range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange underlined.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!")
    ///     print(helloWorld.underlined().isUnderlined())
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a underlined NSMutableAttributedString.
    func underlined(in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: replacementRange)
        return mutableAttributedString
    }
    
    /// Underlines within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!")
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.underline(in: range)
    ///     print(helloWorld.isUnderlined(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    func underline(in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with underline within a NSRange removed.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.underlineStyle: true])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.removingUnderline(in: range).isUnderlined(in: range))
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a underline removed NSMutableAttributedString.
    func removingUnderline(in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.styleNone.rawValue, range: replacementRange)
        return mutableAttributedString
    }
    
    /// Removes the underline within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.underlineStyle: true])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.removeUnderline(in: range)
    ///     print(helloWorld.isUnderlined(in: range))
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    func removeUnderline(in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.underlineStyle, value: NSUnderlineStyle.styleNone.rawValue, range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedStringwith the text within a NSRange highlighted.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!")
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.highlighted(with: .white, in: range).isHighlighted(with: .white, in: range))
    ///     // Prints "true"
    ///
    /// - Parameter color: background color.
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a highlighted NSMutableAttributedString.
    func highlighted(with color: UIColor, in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.backgroundColor, value: color, range: replacementRange)
        return mutableAttributedString
    }
    
    /// Highlights the text within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!")
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.highlight(with: .white, in: range)
    ///     print(helloWorld.isHighlighted(with: .white, in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    func highlight(with color: UIColor, in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.backgroundColor, value: color, range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange unhighlighted.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.backgroundColor: UIColor.white])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.unhighlighted(in: range).isHighlighted(with: .white, in: range))
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a unhighlighted NSMutableAttributedString.
    func unhighlighted(in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.backgroundColor, value: UIColor.clear, range: replacementRange)
        return mutableAttributedString
    }
    
    /// Unhighlights the text within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.backgroundColor: UIColor.white])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.unhighlight(in: range)
    ///     print(helloWorld.isHighlighted(with: .white, in: range))
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    func unhighlight(in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.backgroundColor, value: UIColor.clear, range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange crossed out.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!")
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.usingStrikethrough(in: range).isStrikethrough(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func usingStrikethrough(in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.strikethroughStyle, value: NSNumber.init(value: 1), range: replacementRange)
        return mutableAttributedString
    }
    
    /// Crosses out the text within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!")
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.useStrikethrough(in: range)
    ///     print(helloWorld.isStrikethrough(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    func useStrikethrough(in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.strikethroughStyle, value: NSNumber.init(value: 1), range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange not crossed out.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.strikethroughStyle: true])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.removingStrikethrough(in: range).isStrikethrough())
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func removingStrikethrough(in range: NSRange? = nil) -> NSMutableAttributedString {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttribute(.strikethroughStyle, value: NSNumber.init(value: 0), range: replacementRange)
        return mutableAttributedString
    }
    
    // Removes the strikethrough of the text within a NSRange.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.strikethroughStyle: true])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.removeStrikethrough(in: range)
    ///     print(helloWorld.isStrikethrough())
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    func removeStrikethrough(in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        addAttribute(.strikethroughStyle, value: NSNumber.init(value: 0), range: replacementRange)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange using traits.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.usingTraits(.traitBold, in: range).isBold(in: range))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - traits: UIFontDescriptorSymbolicTraits.
    ///   - range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func usingTraits(_ traits: UIFontDescriptorSymbolicTraits, in range: NSRange? = nil) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let options = NSAttributedString.EnumerationOptions(rawValue: 0)
        mutableAttributedString.enumerateAttribute(.font, in: replacementRange, options: options, using: { (value: Any, range: NSRange, _) in
            if let currentFont = value as? UIFont {
                let newTraits = currentFont.fontDescriptor.symbolicTraits.union(traits)
                if let descriptor = currentFont.fontDescriptor.withSymbolicTraits(newTraits) {
                    let font = UIFont(descriptor: descriptor, size: 0)
                    mutableAttributedString.addAttribute(.font, value: font, range: range)
                }
            }
        })
        return mutableAttributedString
    }
    
    /// Uses traits within a NSRange
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.useTraits(.traitBold, in: range)
    ///     print(helloWorld.isBold(in: range))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - traits: UIFontDescriptorSymbolicTraits.
    ///   - range: the NSRange of the text.
    func useTraits(_ traits: UIFontDescriptorSymbolicTraits, in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let options = NSAttributedString.EnumerationOptions(rawValue: 0)
        enumerateAttribute(.font, in: replacementRange, options: options, using: { (value: Any, range: NSRange, _) in
            if let currentFont = value as? UIFont {
                let newTraits = currentFont.fontDescriptor.symbolicTraits.union(traits)
                if let descriptor = currentFont.fontDescriptor.withSymbolicTraits(newTraits) {
                    let font = UIFont(descriptor: descriptor, size: 0)
                    self.addAttribute(.font, value: font, range: range)
                }
            }
        })
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange using bold.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.usingBold(in: range).isBold(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func usingBold(in range: NSRange? = nil) -> NSMutableAttributedString {
        return usingTraits(.traitBold, in: range)
    }
    
    /// Uses bold within a NSRange
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.useBold(in: range)
    ///     print(helloWorld.isBold(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: a NSRange
    func useBold(in range: NSRange? = nil) {
        useTraits(.traitBold, in: range)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange using italic.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.italicized(in: range).isItalic(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func italicized(in range: NSRange? = nil) -> NSMutableAttributedString {
        return usingTraits(.traitItalic, in: range)
    }
    
    /// Uses italic within a NSRange
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.systemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.italicize(in: range)
    ///     print(helloWorld.isItalic(in: range))
    ///     // Prints "true"
    ///
    /// - Parameter range: the NSRange of the text.
    func italicize(in range: NSRange? = nil) {
        useTraits(.traitItalic, in: range)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange traits removed.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.boldSystemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.removingTraits(.traitBold, in: range).isBold())
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - traits: UIFontDescriptorSymbolicTraits.
    ///   - range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func removingTraits(_ traits: UIFontDescriptorSymbolicTraits, in range: NSRange? = nil) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let options = NSAttributedString.EnumerationOptions(rawValue: 0)
        mutableAttributedString.enumerateAttribute(.font, in: replacementRange, options: options, using: { (value: Any, range: NSRange, _) in
            if let currentFont = value as? UIFont {
                let newTraits = currentFont.fontDescriptor.symbolicTraits.subtracting(traits)
                if let descriptor = currentFont.fontDescriptor.withSymbolicTraits(newTraits) {
                    let font = UIFont(descriptor: descriptor, size: 0)
                    mutableAttributedString.addAttribute(.font, value: font, range: range)
                }
            }
        })
        return mutableAttributedString
    }
    
    /// Removes traits within a NSRange
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.boldSystemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.removeTraits(.traitBold, in: range)
    ///     print(helloWorld.isBold())
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - traits: UIFontDescriptorSymbolicTraits.
    ///   - range: the NSRange of the text.
    func removeTraits(_ traits: UIFontDescriptorSymbolicTraits, in range: NSRange? = nil) {
        let replacementRange = range ?? NSMakeRange(0, string.count)
        let options = NSAttributedString.EnumerationOptions(rawValue: 0)
        enumerateAttribute(.font, in: replacementRange, options: options, using: { (value: Any, range: NSRange, _) in
            if let currentFont = value as? UIFont {
                let newTraits = currentFont.fontDescriptor.symbolicTraits.subtracting(traits)
                if let descriptor = currentFont.fontDescriptor.withSymbolicTraits(newTraits) {
                    let font = UIFont(descriptor: descriptor, size: 0)
                    self.addAttribute(.font, value: font, range: range)
                }
            }
        })
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange bold removed.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.boldSystemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.removingBold(in: range).isBold())
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func removingBold(in range: NSRange? = nil) -> NSMutableAttributedString {
        return removingTraits(.traitBold, in: range)
    }
    
    /// Removes bold within a NSRange
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.boldSystemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.removeBold(in: range)
    ///     print(helloWorld.isBold())
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    func removeBold(in range: NSRange? = nil) {
        removeTraits(.traitBold, in: range)
    }
    
    /// Returns a NSMutableAttributedString with the text within a NSRange italic removed.
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.italicSystemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     print(helloWorld.removingItalic(in: range).isItalic())
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    /// - Returns: a NSMutableAttributedString.
    func removingItalic(in range: NSRange? = nil) -> NSMutableAttributedString {
        return removingTraits(.traitItalic, in: range)
    }
    
    /// Removes italic within a NSRange
    ///
    ///     let helloWorld = NSMutableAttributedString(string: "Hello world!", attributes: [.font: UIFont.italicSystemFont(ofSize: 8.0)])
    ///     let range = NSRange(location: 0, length: 1)
    ///     helloWorld.removeItalic(in: range)
    ///     print(helloWorld.isItalic())
    ///     // Prints "false"
    ///
    /// - Parameter range: the NSRange of the text.
    func removeItalic(in range: NSRange? = nil) {
        removeTraits(.traitItalic, in: range)
    }
    
}
