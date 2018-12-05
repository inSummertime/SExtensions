//
//  DecodableInitJSONStringTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/23.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

class DecodableInitJSONStringTests: XCTestCase {

    func testInitJSONString() {
        let jsonString = "{\"hello\":\"world\"}"
        struct Object: Decodable {
            let hello: String
        }
        do {
            let object = try Object(jsonString: jsonString)
            XCTAssertEqual(object!.hello, "world")
        } catch {
            XCTFail()
        }

        let jsonStringEmpty = "{\"hello\":\"\"}"
        struct ObjectEmpty: Decodable {
            let hello: String
        }
        do {
            let objectEmpty = try ObjectEmpty(jsonString: jsonStringEmpty)
            XCTAssertEqual(objectEmpty!.hello, "")
        } catch {
            XCTFail()
        }

        let jsonStringInt = "{\"hello\":0}"
        struct ObjectInt: Decodable {
            let hello: Int
        }
        do {
            let objectInt = try ObjectInt(jsonString: jsonStringInt)
            XCTAssertEqual(objectInt!.hello, 0)
        } catch {
            XCTFail()
        }

        let jsonStringArray = "{\"hello\":[\"world\",\"!\"]}"
        struct ObjectArray: Decodable {
            let hello: [String]
        }
        do {
            let objectArray = try ObjectArray(jsonString: jsonStringArray)
            XCTAssertEqual(objectArray!.hello, ["world", "!"])
        } catch {
            XCTFail()
        }

        let jsonStringDictionary = "{\"hello\":{\"world\":\"!\"}}"
        struct ObjectDictionary: Decodable {
            let hello: [String: String]
        }
        do {
            let objectDictionary = try ObjectDictionary(jsonString: jsonStringDictionary)
            XCTAssertEqual(objectDictionary!.hello, ["world": "!"])
        } catch {
            XCTFail()
        }

        let jsonStringCodable = "{\"hello\":\"world\"}"
        struct ObjectCodable: Codable {
            let hello: String
        }
        do {
            let objectCodable = try ObjectCodable(jsonString: jsonStringCodable)
            XCTAssertEqual(objectCodable!.hello, "world")
        } catch {
            XCTFail()
        }
    }

}
