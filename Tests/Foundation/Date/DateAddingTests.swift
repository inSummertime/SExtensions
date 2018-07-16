//
//  DateAddingTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateAddingTests: XCTestCase {
    
    func testAdding() {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = Date(string: "2018.07.16 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: calendar)
        
        let nextHour = Date(string: "2018.07.16 at 01:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: calendar)
        XCTAssertEqual(date!.addingComponentDictionary([.hour: 1], in: calendar), nextHour!)
        
        let nextDate = Date(string: "2018.07.17 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: calendar)
        XCTAssertEqual(date!.addingComponentDictionary([.day: 1], in: calendar), nextDate!)
        
        let lastDate = Date(string: "2018.07.15 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: calendar)
        XCTAssertEqual(date!.addingComponentDictionary([.day: -1], in: calendar), lastDate!)
    }
    
}
