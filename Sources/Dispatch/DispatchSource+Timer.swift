//
//  DispatchSource+Timer.swift
//  SExtensions
//
//  Created by Ray on 2018/9/8.
//  Copyright © 2018 Ray. All rights reserved.
//

import Dispatch

public extension DispatchSource {

    /// Returns a DispatchSourceTimer.
    ///
    /// - Parameters:
    ///   - delay: The time from now at which the first timer event will be delivered, subject
    ///     to the leeway and other considerations described above. The deadline is based on
    ///     Mach absolute
    ///   - interval: The repeat interval for the timer, or `.never` if the timer should fire
    ///     only once.
    ///   - isRepeating: Whether the handler will execute repeatly.
    ///   - queue: A dispatch queue the handler will execute on.
    ///   - handler: A handler to execute.
    /// - Returns: A DispatchSourceTimer.
    class func timer(delay: TimeInterval = 0,
                     interval: TimeInterval = 1.0,
                     isRepeating: Bool = true,
                     queue: DispatchQueue = .main,
                     handler: @escaping (DispatchSourceTimer) -> Void) -> DispatchSourceTimer {
        let timer = DispatchSource.makeTimerSource(queue: queue)
        let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(Int(delay))
        let dispatchTimeInterval = DispatchTimeInterval.seconds(Int(interval))
        timer.setEventHandler { [weak timer] in
            guard let weakTimer = timer else { return }
            handler(weakTimer)
        }
        if isRepeating {
            timer.schedule(deadline: deadline, repeating: dispatchTimeInterval)
        } else {
            timer.schedule(deadline: deadline, repeating: .never)
        }
        timer.resume()
        return timer
    }

}
