//
//  SKSheduleTimerDelegate.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

import Foundation

/// Abstraction for Schedule a timer with sprite kit components, in order to avoid bugs in the iOS life cycle. When the app its in background for example, with NSTimer many bugs could happen. This timer its not affected by the background or foreground changes
public protocol SKSheduleTimerDelegate: class {
    /// Called when a block of time has been pased, usually called every second
    /// - Parameter currentTime: The current time of the timer, for example 20.0
    func didChangeTime(currentTime: TimeInterval)
}
