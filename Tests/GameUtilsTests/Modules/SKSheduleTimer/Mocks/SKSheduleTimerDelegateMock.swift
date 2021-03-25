//
//  SKSheduleTimerDelegateMock.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

import Foundation
@testable import GameUtils

/// Gives a control to access to the calls
struct SKSheduleTimerDelegateMockCalls {
    var didChangeTime: Bool = false
}

/// Implementation of the `SKSheduleTimerDelegate`, used for simulate a given behavior
class SKSheduleTimerDelegateMock: SKSheduleTimerDelegate {

    // MARK: - PROPERTIES
    var calls: SKSheduleTimerDelegateMockCalls = SKSheduleTimerDelegateMockCalls()
    var currentPassTime: TimeInterval = TimeInterval.zero

    // MARK: - DELEGATE METHODS
    func didChangeTime(currentTime: TimeInterval) {
        calls.didChangeTime = true
        currentPassTime = currentTime
    }

}
