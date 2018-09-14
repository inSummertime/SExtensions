//
//  String+IsPhoneNumber.swift
//  SExtensions
//
//  Created by Ray on 2018/9/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension String {
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, count))
            if let first = matches.first {
                return first.resultType == .phoneNumber && first.range.location == 0 && first.range.length == count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
}
