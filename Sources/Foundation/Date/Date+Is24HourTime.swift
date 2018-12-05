//
//  Date+Is24HourTime.swift
//  SExtensions
//
//  Created by Ray on 2018/8/4.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {

    /// whether is 24-hour time
    var is24HourTime: Bool {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: self)
        let amRange = dateString.range(of: formatter.amSymbol)
        let pmRange = dateString.range(of: formatter.pmSymbol)
        return amRange == nil && pmRange == nil
    }

}
