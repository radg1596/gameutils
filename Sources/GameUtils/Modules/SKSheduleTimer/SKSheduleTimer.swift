//
//  SKSheduleTimer.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

import Foundation
import SpriteKit

// Counter timer, this type of timer just count up, and call to his delegate on determinated events.
// Stars on zero and go to the CGFloat more big value
public class SKSheduleTimer {

    // MARK: - PROPERTIES
    /// Used for determinated events schedule
    public weak var delegate: SKSheduleTimerDelegate?
    /// The target spriteKit scene
    public weak var targetScene: SKScene?
    private let constants: SKSheduleTimerConstants = SKSheduleTimerConstants()
    private var currentCountTime: TimeInterval

    // MARK: - INIT
    /// Creates an instance of a timer appropiate for SpriteKit. Avoids iOS life cycle bugs.
    public init() {
        currentCountTime = constants.initialCurrentCountTime
    }

    // MARK: - EXPOSED METHODS
    /// Fires a timer to count down, repeats the action forever
    public func fire() {
        let timeSecondAction: SKAction = SKAction.wait(forDuration: constants.timeIntervalForSecond)
        let bussinessLogicAction: SKAction = SKAction.run { [weak self] in
            guard let self = self else { return }
            self.currentCountTime += self.constants.timeIntervalForSecond
            self.delegate?.didChangeTime(currentTime: self.currentCountTime)
        }
        let sequenceAction: SKAction = SKAction.sequence([timeSecondAction, bussinessLogicAction])
        let repeatForEverAction: SKAction = SKAction.repeatForever(sequenceAction)
        targetScene?.run(repeatForEverAction,
                         withKey: constants.skScheduleTimerKey)
    }

    /// Stops the timer, removes the action from the target scene
    public func stop() {
        targetScene?.removeAction(forKey: constants.skScheduleTimerKey)
    }

}

