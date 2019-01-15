//
//  DispatchQueue+Delay.swift
//  SExtensions
//
//  Created by Ray on 2018/9/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import Dispatch

public extension DispatchQueue {

    /// Performs the action after a specified seconds.
    ///
    /// - Parameter seconds: A specified time in seconds.
    /// - Parameter completion: The completion handler.
    func delay(_ seconds: Double, completionHandler: @escaping () -> Void) {
        let delayTime = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        asyncAfter(deadline: delayTime) {
            completionHandler()
        }
    }
}
