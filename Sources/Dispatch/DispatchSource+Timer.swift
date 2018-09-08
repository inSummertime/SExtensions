//
//  DispatchSource+Timer.swift
//  SExtensions
//
//  Created by Ray on 2018/9/8.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension DispatchSource {
    
    class func timer(delay: TimeInterval = 0, interval: TimeInterval = 1.0, isRepeating: Bool = true, queue: DispatchQueue = .main, handler: @escaping () -> Void) -> DispatchSourceTimer {
        let timer = DispatchSource.makeTimerSource(queue: queue)
        let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(Int(interval))
        let dispatchTimeInterval = DispatchTimeInterval.seconds(Int(interval))
        timer.setEventHandler {
            handler()
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
