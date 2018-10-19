//
//  StringNumberTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringNumberTests: XCTestCase {
    
    func testNumber() {
        XCTAssertNotNil("1".number)
        XCTAssertNil("a".number)
        XCTAssertNil("*".number)
        XCTAssertNil("(1)".number)
        XCTAssertNotNil("-1".number)
        XCTAssertNotNil("1.0".number)
        XCTAssertNotNil("-1.0".number)
        XCTAssertNotNil("9223372036854775807".number) // Int.max
        XCTAssertNotNil("9223372036854775808".number) // Int.max + 1
        XCTAssertNotNil("  \n\n  -1.0  \n\n  ".number)
        XCTAssertNotNil("1,0".number)
    }
    
    func testNumberValue() {
        XCTAssertEqual("1".numberValue, NSNumber(value: 1))
        XCTAssertEqual("a".numberValue, NSNumber(value: 0))
        XCTAssertEqual("*".numberValue, NSNumber(value: 0))
        XCTAssertEqual("(1)".numberValue, NSNumber(value: 0))
        XCTAssertEqual("-1".numberValue, NSNumber(value: -1))
        XCTAssertEqual("1.0".numberValue, NSNumber(value: 1.0))
        XCTAssertEqual("-1.0".numberValue, NSNumber(value: -1.0))
        XCTAssertEqual("9223372036854775807".numberValue, NSNumber(value: 9223372036854775807)) // Int.max
        XCTAssertEqual("9223372036854775808".numberValue, NSNumber(value: 9223372036854775808.0)) // Int.max + 1
        XCTAssertEqual("\n 1.0 \n".numberValue, NSNumber(value: 1.0))
        XCTAssertEqual("1,0".numberValue, NSNumber(value: 1.0))
    }
    
    func testIsNumber() {
        XCTAssertTrue("1".isNumber)
        XCTAssertFalse("a".isNumber)
        XCTAssertFalse("*".isNumber)
        XCTAssertFalse("(1)".isNumber)
        XCTAssertTrue("-1".isNumber)
        XCTAssertTrue("1.0".isNumber)
        XCTAssertTrue("-1.0".isNumber)
        XCTAssertTrue("9223372036854775807".isNumber) // Int.max
        XCTAssertTrue("9223372036854775808".isNumber) // Int.max + 1
        XCTAssertTrue("  \n\n  -1.0  \n\n  ".isNumber)
        XCTAssertTrue("1,0".isNumber)
    }
    
    func testInt() {
        XCTAssertNil("Hello world!".int)
        XCTAssertNotNil("\(Int.max)".int)
        XCTAssertNil("9223372036854775808".int) // Int.max + 1
        XCTAssertNotNil("\(Int.min)".int) // Int.min
        XCTAssertNil("-9223372036854775809".int) // Int.min - 1
        XCTAssertNil("0.0".int)
        XCTAssertNotNil("  \n\n  -1  \n\n  ".int)
    }
    
    func testIntValue() {
        XCTAssertEqual("Hello world!".intValue, 0)
        XCTAssertEqual("9223372036854775807".intValue, 9223372036854775807) // Int.max
        XCTAssertEqual("9223372036854775808".intValue, -9223372036854775808) // Int.max + 1
        XCTAssertEqual("-9223372036854775808".intValue, -9223372036854775808) // Int.min
        XCTAssertEqual("-9223372036854775809".intValue, 9223372036854775807) // Int.min - 1
        XCTAssertEqual("1.0".intValue, 1)
    }
    
    func testIsInt() {
        XCTAssertFalse("Hello world!".isInt)
        XCTAssertTrue("9223372036854775807".isInt) // Int.max
        XCTAssertFalse("9223372036854775808".isInt) // Int.max + 1
        XCTAssertTrue("-9223372036854775808".isInt) // Int.min
        XCTAssertFalse("9223372036854775809".isInt) // Int.min - 1
    }
    
    func testInt8() {
        XCTAssertNil("Hello world!".int8)
        XCTAssertNotNil("127".int8) // Int8.max
        XCTAssertNil("128".int8) // Int8.max + 1
        XCTAssertNotNil("-128".int8) // Int8.min
        XCTAssertNil("-129".int8) // Int8.min - 1
        XCTAssertNil("0.0".int8)
        XCTAssertNotNil("  \n\n  -1  \n\n  ".int8)
    }
    
    func testInt8Value() {
        XCTAssertEqual("Hello world!".int8Value, 0)
        XCTAssertEqual("127".int8Value, 127) // Int8.max
        XCTAssertEqual("128".int8Value, -128) // Int8.max + 1
        XCTAssertEqual("-128".int8Value, -128) // Int8.min
        XCTAssertEqual("-129".int8Value, 127) // Int8.min - 1
        XCTAssertEqual("1.0".int8Value, 1)
    }
    
    func testIsInt8() {
        XCTAssertFalse("Hello world!".isInt8)
        XCTAssertTrue("127".isInt8) // Int8.max
        XCTAssertFalse("128".isInt8) // Int8.max + 1
        XCTAssertTrue("-128".isInt8) // Int8.min
        XCTAssertFalse("129".isInt8) // Int8.min - 1
    }
    
    func testInt16() {
        XCTAssertNil("Hello world!".int16)
        XCTAssertNotNil("32767".int16) // Int16.max
        XCTAssertNil("32768".int16) // Int16.max + 1
        XCTAssertNotNil("-32768".int16) // Int16.min
        XCTAssertNil("-32769".int16) // Int16.min - 1
        XCTAssertNil("0.0".int16)
        XCTAssertNotNil("  \n\n  -1  \n\n  ".int16)
    }
    
    func testInt16Value() {
        XCTAssertEqual("Hello world!".int16Value, 0)
        XCTAssertEqual("32767".int16Value, 32767) // Int16.max
        XCTAssertEqual("32768".int16Value, -32768) // Int16.max + 1
        XCTAssertEqual("-32768".int16Value, -32768) // Int16.min
        XCTAssertEqual("-32769".int16Value, 32767) // Int16.min - 1
        XCTAssertEqual("1.0".int16Value, 1)
    }
    
    func testIsInt16() {
        XCTAssertFalse("Hello world!".isInt16)
        XCTAssertTrue("32767".isInt16) // Int16.max
        XCTAssertFalse("32768".isInt16) // Int16.max + 1
        XCTAssertTrue("-32768".isInt16) // Int16.min
        XCTAssertFalse("32769".isInt16) // Int16.min - 1
    }
    
    func testInt32() {
        XCTAssertNil("Hello world!".int32)
        XCTAssertNotNil("2147483647".int32) // Int32.max
        XCTAssertNil("2147483648".int32) // Int32.max + 1
        XCTAssertNotNil("-2147483648".int32) // Int32.min
        XCTAssertNil("-2147483649".int32) // Int32.min - 1
        XCTAssertNil("0.0".int32)
        XCTAssertNotNil("  \n\n  -1  \n\n  ".int32)
    }
    
    func testIsInt32() {
        XCTAssertFalse("Hello world!".isInt32)
        XCTAssertTrue("2147483647".isInt32) // Int32.max
        XCTAssertFalse("2147483648".isInt32) // Int32.max + 1
        XCTAssertTrue("-2147483648".isInt32) // Int32.min
        XCTAssertFalse("2147483649".isInt32) // Int32.min - 1
    }
    
    func testInt32Value() {
        XCTAssertEqual("Hello world!".int32Value, 0)
        XCTAssertEqual("2147483647".int32Value, 2147483647) // Int32.max
        XCTAssertEqual("2147483648".int32Value, -2147483648) // Int32.max + 1
        XCTAssertEqual("-2147483648".int32Value, -2147483648) // Int32.min
        print(Int32.min)
        XCTAssertEqual("-2147483649".int32Value, -2147483648) // Int32.min - 1
        XCTAssertEqual("-2147483650".int32Value, -2147483648) // Int32.min - 2
        XCTAssertEqual("-2147483651".int32Value, -2147483648) // Int32.min - 3
        XCTAssertEqual("1.0".int32Value, 1)
    }
    
    func testInt64() {
        XCTAssertNil("Hello world!".int64)
        XCTAssertNotNil("9223372036854775807".int64) // Int64.max
        XCTAssertNil("9223372036854775808".int64) // Int64.max + 1
        XCTAssertNotNil("-9223372036854775808".int64) // Int64.min
        XCTAssertNil("-9223372036854775809".int64) // Int64.min - 1
        XCTAssertNil("0.0".int64)
        XCTAssertNotNil("  \n\n  -1  \n\n  ".int64)
    }
    
    func testInt64Value() {
        XCTAssertEqual("Hello world!".int64Value, 0)
        XCTAssertEqual("9223372036854775807".int64Value, 9223372036854775807) // Int64.max
        XCTAssertEqual("9223372036854775808".int64Value, -9223372036854775808) // Int64.max + 1
        XCTAssertEqual("-9223372036854775808".int64Value, -9223372036854775808) // Int64.min
        XCTAssertEqual("-9223372036854775809".int64Value, 9223372036854775807) // Int64.min - 1
        XCTAssertEqual("1.0".int64Value, 1)
    }
    
    func testIsInt64() {
        XCTAssertFalse("Hello world!".isInt64)
        XCTAssertTrue("9223372036854775807".isInt64) // Int64.max
        XCTAssertFalse("9223372036854775808".isInt64) // Int64.max + 1
        XCTAssertTrue("-9223372036854775808".isInt64) // Int64.min
        XCTAssertFalse("-9223372036854775809".isInt64) // Int64.min - 1
    }
    
    func testFloat() {
        XCTAssertNil("Hello world!".float)
        XCTAssertNotNil("0".float)
        XCTAssertNotNil("0.1".float)
        XCTAssertNotNil("  \n\n  -1.0  \n\n  ".float)
    }
    
    func testFloatValue() {
        XCTAssertEqual("Hello world!".floatValue, Float(0.0))
        XCTAssertEqual("0".floatValue, Float(0.0))
        XCTAssertEqual("0.1".floatValue, Float(0.1))
    }
    
    func testIsFloat() {
        XCTAssertFalse("Hello world!".isFloat)
        XCTAssertTrue("0".isFloat)
        XCTAssertTrue("0.1".isFloat)
    }
    
    func testDouble() {
        XCTAssertNil("Hello world!".double)
        XCTAssertNotNil("0".double)
        XCTAssertNotNil("0.1".double)
        XCTAssertNotNil("  \n\n  -1.0  \n\n  ".double)
    }
    
    func testDoubleValue() {
        XCTAssertEqual("Hello world!".doubleValue, 0.0)
        XCTAssertEqual("0".doubleValue, 0.0)
        XCTAssertEqual("0.1".doubleValue, 0.1)
    }
    
    func testIsDouble() {
        XCTAssertFalse("Hello world!".isDouble)
        XCTAssertTrue("0".isDouble)
        XCTAssertTrue("0.1".isDouble)
    }
    
    func testfromRoman() {
        XCTAssertEqual("I".intFromRoman, 1)
        XCTAssertEqual("II".intFromRoman, 2)
        XCTAssertEqual("III".intFromRoman, 3)
        XCTAssertEqual("IV".intFromRoman, 4)
        XCTAssertEqual("V".intFromRoman, 5)
        XCTAssertEqual("VI".intFromRoman, 6)
        XCTAssertEqual("VII".intFromRoman, 7)
        XCTAssertEqual("VIII".intFromRoman, 8)
        XCTAssertEqual("IX".intFromRoman, 9)
        XCTAssertEqual("X".intFromRoman, 10)
        XCTAssertEqual("XI".intFromRoman, 11)
        XCTAssertEqual("XL".intFromRoman, 40)
        XCTAssertEqual("L".intFromRoman, 50)
        XCTAssertEqual("LX".intFromRoman, 60)
        XCTAssertEqual("LXIX".intFromRoman, 69)
        XCTAssertEqual("XC".intFromRoman, 90)
        XCTAssertEqual("XCIX".intFromRoman, 99)
        XCTAssertEqual("C".intFromRoman, 100)
        XCTAssertEqual("CX".intFromRoman, 110)
        XCTAssertEqual("CD".intFromRoman, 400)
        XCTAssertEqual("D".intFromRoman, 500)
        XCTAssertEqual("DC".intFromRoman, 600)
        XCTAssertEqual("DCXLIX".intFromRoman, 649)
        XCTAssertEqual("CM".intFromRoman, 900)
        XCTAssertEqual("CMXCIX".intFromRoman, 999)
        XCTAssertEqual("M".intFromRoman, 1000)
        XCTAssertEqual("MC".intFromRoman, 1100)
        XCTAssertEqual("MCXCIX".intFromRoman, 1199)
        XCTAssertEqual("MMMMCMXCIX".intFromRoman, 4999)
        XCTAssertNil("IVA".intFromRoman)
        XCTAssertNil("AIV".intFromRoman)
    }

}
