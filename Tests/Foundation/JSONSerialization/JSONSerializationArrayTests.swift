//
//  JSONSerializationArrayTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/4.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class JSONSerializationArrayTests: XCTestCase {
    
    func testArrayFromJSONFile() {
        do {
            let array = try JSONSerialization.arrayFromJSONFile(filename: "Array", callerClass: JSONSerializationArrayTests.self)
            let anotherArray = try  JSONSerialization.arrayFromJSONFile(filename: "Array.json", callerClass: JSONSerializationArrayTests.self)
            XCTAssertEqual(array![0]["id"] as! Int, 0)
            XCTAssertEqual(anotherArray![1]["title"] as! String, "title")
        } catch {
            XCTFail()
        }
    }
    
    func testArrayFromJSONString() {
        let string = "[{\"id\":\"1\"},{\"title\":\"title\"}]"
        do {
            let array = try JSONSerialization.arrayFromJSONString(string)
            XCTAssertEqual(array![0]["id"] as! String, "1")
            XCTAssertEqual(array![1]["title"] as! String, "title")
        } catch {
            XCTFail()
        }
    }
    
}
