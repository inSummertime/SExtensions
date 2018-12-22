//
//  CALayer+PauseAndResumeAnimation.swift
//  SExtensions
//
//  Created by Ray on 2018/12/22.
//  Copyright © 2018 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {
    
    /// Pauses the animation.
    func pauseAnimation() {
        let pauseTime = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0
        timeOffset = pauseTime
    }
    
    /// Resumes the animation.
    func resumeAnimation() {
        let pauseTime = timeOffset
        timeOffset = 0
        beginTime = 0
        speed = 1
        beginTime = convertTime(CACurrentMediaTime(), from: nil) - pauseTime
    }
    
}
