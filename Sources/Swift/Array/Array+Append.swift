//
//  Array+Append.swift
//  SExtensions
//
//  Created by Ray on 2018/9/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    @discardableResult
    mutating func appendIfNotContains(_ newElement: Element) -> Bool {
        if contains(newElement) {
            return false
        } else {
            append(newElement)
            return true
        }
    }
    
    @discardableResult
    mutating func append(_ newElement: Element, maxCountOfElement: Int) -> Bool {
        let countOfElment = filter{ $0 == newElement }.count
        if countOfElment >= maxCountOfElement {
            return false
        } else {
            append(newElement)
            return true
        }
    }

}
