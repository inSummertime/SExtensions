//
//  Double+Time.swift
//  SExtensions
//
//  Created by Ray on 2018/7/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Represents a time interval in milliseconds
    ///
    ///     print(1.0.milliseconds)
    ///     // Prints "1000.0"
    var milliseconds: TimeInterval {
        return self * 1000.0
    }
    
    /// Represents a time interval in seconds
    ///
    ///     print(1.0.seconds)
    ///     // Prints "1.0"
    var seconds: TimeInterval {
        return self
    }
    
    /// Represents a time interval in minutes
    ///
    ///     print(60.0.minutes)
    ///     // Prints "1.0"
    var minutes: TimeInterval {
        return self / 60.0
    }
    
    /// Represents a time interval in hours
    ///
    ///     print(3600.0.hours)
    ///     // Prints "1.0"
    var hours: TimeInterval {
        return self / 3600.0
    }
    
    /// Represents a time interval in days
    ///
    ///     print(86400.0.days)
    ///     // Prints "1.0"
    var days: TimeInterval {
        return self / 3600.0 / 24.0
    }
    
}
