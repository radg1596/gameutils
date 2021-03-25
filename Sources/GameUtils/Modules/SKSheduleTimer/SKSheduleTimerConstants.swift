//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

import Foundation

/// Constants for the module of ´SKScheduleTimer´
class SKSheduleTimerConstants {

    /// Key used to be an unique id for the Timer
    let skScheduleTimerKey: String = "skScheduleTimerKey_\(UUID().uuidString)"
    /// Chunk portion of time for SKSchedule timer
    let timeIntervalForSecond: TimeInterval = 1.0
    /// The initial current time for the timer
    let initialCurrentCountTime: TimeInterval = TimeInterval.zero

}
