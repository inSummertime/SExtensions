//
//  String+Number.swift
//  SExtensions
//
//  Created by Ray on 2018/6/3.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension String {

    /// Returns a number if it can
    ///
    ///     print("1".number)
    ///     // Prints "Optional(1)"
    var number: NSNumber? {
        if NSDecimalNumber(string: self) == .notANumber {
            return nil
        }
        return NSDecimalNumber(string: self)
    }

    /// Returns a number or zero
    ///
    ///     print("1".numberValue)
    ///     // Prints "1"
    var numberValue: NSNumber {
        if NSDecimalNumber(string: self) == .notANumber {
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber(string: self)
    }

    /// Returns true if it is a Number
    ///
    ///     print("1".isNumber)
    ///     // Prints "true"
    var isNumber: Bool {
        return number != nil
    }

    /// Returns a Int if it can
    ///
    ///     print("1".int)
    ///     // Prints "Optional(1)"
    var int: Int? {
        return Int(trimmed)
    }

    /// Returns a Int or zero
    ///
    ///     print("1".intValue)
    ///     // Prints "1"
    var intValue: Int {
        return numberValue.intValue
    }

    /// Returns true if it is an Int
    ///
    ///     print("1".isInt)
    ///     // Prints "true"
    var isInt: Bool {
        return int != nil
    }

    /// Returns a UInt if it can
    ///
    ///     print("1".uint)
    ///     // Prints "Optional(1)"
    var uint: UInt? {
        return UInt(trimmed)
    }

    /// Returns a UInt or zero
    ///
    ///     print("1".uintValue)
    ///     // Prints "1"
    var uintValue: UInt {
        return numberValue.uintValue
    }

    /// Returns true if it is an UInt
    ///
    ///     print("1".isUInt)
    ///     // Prints "true"
    var isUInt: Bool {
        return uint != nil
    }

    /// Returns a Int8 if it can
    ///
    ///     print("1".int8)
    ///     // Prints "Optional(1)"
    var int8: Int8? {
        return Int8(trimmed)
    }

    /// Returns a Int8 or zero
    ///
    ///     print("1".int8Value)
    ///     // Prints "1"
    var int8Value: Int8 {
        return numberValue.int8Value
    }

    /// Returns true if it is an Int8
    ///
    ///     print("1".isInt8)
    ///     // Prints "true"
    var isInt8: Bool {
        return int8 != nil
    }

    /// Returns a UInt8 if it can
    ///
    ///     print("1".uint8)
    ///     // Prints "Optional(1)"
    var uint8: UInt8? {
        return UInt8(trimmed)
    }

    /// Returns a UInt8 or zero
    ///
    ///     print("1".uint8Value)
    ///     // Prints "1"
    var uint8Value: UInt8 {
        return numberValue.uint8Value
    }

    /// Returns true if it is an UInt8
    ///
    ///     print("1".isUInt8)
    ///     // Prints "true"
    var isUInt8: Bool {
        return uint8 != nil
    }

    /// Returns a Int16 if it can
    ///
    ///     print("1".int16)
    ///     // Prints "Optional(1)"
    var int16: Int16? {
        return Int16(trimmed)
    }

    /// Returns a Int16 or zero
    ///
    ///     print("1".int16Value)
    ///     // Prints "1"
    var int16Value: Int16 {
        return numberValue.int16Value
    }

    /// Returns true if it is an Int16
    ///
    ///     print("1".isInt16)
    ///     // Prints "true"
    var isInt16: Bool {
        return int16 != nil
    }

    /// Returns a UInt16 if it can
    ///
    ///     print("1".uint16)
    ///     // Prints "Optional(1)"
    var uint16: UInt16? {
        return UInt16(trimmed)
    }

    /// Returns a UInt16 or zero
    ///
    ///     print("1".uint16Value)
    ///     // Prints "1"
    var uint16Value: UInt16 {
        return numberValue.uint16Value
    }

    /// Returns true if it is an UInt16
    ///
    ///     print("1".isUInt16)
    ///     // Prints "true"
    var isUInt16: Bool {
        return uint16 != nil
    }

    /// Returns a Int32 if it can
    ///
    ///     print("1".int32)
    ///     // Prints "Optional(1)"
    var int32: Int32? {
        return Int32(trimmed)
    }

    /// Returns a Int32 or zero
    ///
    ///     print("1".int32Value)
    ///     // Prints "1"
    var int32Value: Int32 {
        return numberValue.int32Value
    }

    /// Returns true if it is an Int32
    ///
    ///     print("1".isInt32)
    ///     // Prints "true"
    var isInt32: Bool {
        return int32 != nil
    }

    /// Returns a UInt32 if it can
    ///
    ///     print("1".uint32)
    ///     // Prints "Optional(1)"
    var uint32: UInt32? {
        return UInt32(trimmed)
    }

    /// Returns a UInt32 or zero
    ///
    ///     print("1".uint32Value)
    ///     // Prints "1"
    var uint32Value: UInt32 {
        return numberValue.uint32Value
    }

    /// Returns true if it is an UInt32
    ///
    ///     print("1".isUInt32)
    ///     // Prints "true"
    var isUInt32: Bool {
        return uint32 != nil
    }

    /// Returns a Int64 if it can
    ///
    ///     print("1".int64)
    ///     // Prints "Optional(1)"
    var int64: Int64? {
        return Int64(trimmed)
    }

    /// Returns a Int64 or zero
    ///
    ///     print("1".int64Value)
    ///     // Prints "1"
    var int64Value: Int64 {
        return numberValue.int64Value
    }

    /// Returns true if it is an Int64
    ///
    ///     print("1".isInt64)
    ///     // Prints "true"
    var isInt64: Bool {
        return int64 != nil
    }

    /// Returns a UInt64 if it can
    ///
    ///     print("1".uint64)
    ///     // Prints "Optional(1)"
    var uint64: UInt64? {
        return UInt64(trimmed)
    }

    /// Returns a UInt64 or zero
    ///
    ///     print("1".uint64Value)
    ///     // Prints "1"
    var uint64Value: UInt64 {
        return numberValue.uint64Value
    }

    /// Returns true if it is an UInt64
    ///
    ///     print("1".isUInt64)
    ///     // Prints "true"
    var isUInt64: Bool {
        return uint64 != nil
    }

    /// Returns a Float if it can
    ///
    ///     print("1.0".float)
    ///     // Prints "Optional(1.0)"
    var float: Float? {
        return Float(trimmed)
    }

    /// Returns a Float or zero
    ///
    ///     print("1.0".floatValue)
    ///     // Prints "1.0"
    var floatValue: Float {
        return numberValue.floatValue
    }

    /// Returns true if it is a Float
    ///
    ///     print("1.0".isFloat)
    ///     // Prints "true"
    var isFloat: Bool {
        return float != nil
    }

    /// Returns a Double if it can
    ///
    ///     print("1.0".double)
    ///     // Prints "Optional(1.0)"
    var double: Double? {
        return Double(trimmed)
    }

    /// Returns a Double or zero
    ///
    ///     print("1.0".doubleValue)
    ///     // Prints "1.0"
    var doubleValue: Double {
        return numberValue.doubleValue
    }

    /// Returns true if it is a Double
    ///
    ///     print("1.0".isDouble)
    ///     // Prints "true"
    var isDouble: Bool {
        return double != nil
    }

    /// Returns an Int value from a Roman string.
    ///
    ///     print("IV".intFromRoman)
    ///     // Prints "4"
    var intFromRoman: Int? {
        var result = 0
        var temp: Character = " "
        let dictionary: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let subtractionDictionary: [Character: Character] = ["V": "I", "X": "I", "L": "X", "C": "X", "D": "C", "M": "C"]
        for character in self {
            guard let number = dictionary[character] else { return nil }
            result += number
            if let smallRoman = subtractionDictionary[character], let numberToSubstrct = dictionary[smallRoman], smallRoman == temp {
                result -= numberToSubstrct * 2
            }
            temp = character
        }
        return result
    }

}
