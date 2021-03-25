//
//  SKSheduleTimerTests.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

#if !os(macOS)
import XCTest
import SpriteKit
@testable import GameUtils

/**
Tests for the SKSchudule timer, used a mock delegate and a view to simulate the SKScene.
 Also uses a viewController mock only for the tests
*/
class SKSheduleTimerTests: XCTestCase {

    // MARK: - PROPERTIES
    private var sut: SKSheduleTimer?
    private var sutDelegate: SKSheduleTimerDelegate?
    private var mockView: SKSheduleTimerMockViewController?
    private let timeOutForTests: TimeInterval = 10.0

    // MARK: - MOCK ACCESk
    /// Access to the delegate mock
    private var sutDelegateMock: SKSheduleTimerDelegateMock? {
        return sutDelegate as? SKSheduleTimerDelegateMock
    }

    // MARK: - TEST CYCLE LIFE
    override func tearDown() {
        sut = nil
        sutDelegate = nil
        mockView = nil
        super.tearDown()
    }

    override func setUp() {
        super.setUp()
        sut = SKSheduleTimer()
        sutDelegate = SKSheduleTimerDelegateMock()
        mockView = SKSheduleTimerMockViewController.instantiate()
        sut?.delegate = sutDelegate
        sut?.targetScene = mockView?.skScene
    }

    // MARK: - TESTS
    /// Tests that success passed 5 seconds with the SpriteKit timer
    func testsSuccessCountsForFiveSecondsFine() throws {
        // GIVEN
        let sut: SKSheduleTimer = try XCTUnwrap(self.sut)
        let sutDelegateMock: SKSheduleTimerDelegateMock = try XCTUnwrap(self.sutDelegateMock)
        let desiredSeconds: TimeInterval = 5.0
        // THEN
        UIApplication.shared.keyWindow?.rootViewController = mockView
        sut.fire()
        let expectation = XCTestExpectation(description: "testsCountsForFiveSecondsFine")
        DispatchQueue.main.asyncAfter(deadline: .now() + desiredSeconds) {
            XCTAssert(sutDelegateMock.calls.didChangeTime, "Error, not calling to the delegate, in order to communicate the changes")
            XCTAssertEqual(sutDelegateMock.currentPassTime, desiredSeconds, "Error, not passing the expected seconds. The value \(sutDelegateMock.currentPassTime) its different from expected: \(desiredSeconds)")
            expectation.fulfill()
        }
        wait(for: [expectation],
             timeout: timeOutForTests)
    }

    /// Tests that success passed 3 seconds with the SpriteKit timer
    func testsSuccessCountsForThreeSecondsFine() throws {
        // GIVEN
        let sut: SKSheduleTimer = try XCTUnwrap(self.sut)
        let sutDelegateMock: SKSheduleTimerDelegateMock = try XCTUnwrap(self.sutDelegateMock)
        let desiredSeconds: TimeInterval = 3.0
        // THEN
        UIApplication.shared.keyWindow?.rootViewController = mockView
        sut.fire()
        let expectation = XCTestExpectation(description: "testsCountsForFiveSecondsFine")
        DispatchQueue.main.asyncAfter(deadline: .now() + desiredSeconds) {
            XCTAssert(sutDelegateMock.calls.didChangeTime, "Error, not calling to the delegate, in order to communicate the changes")
            XCTAssertEqual(sutDelegateMock.currentPassTime, desiredSeconds, "Error, not passing the expected seconds. The value \(sutDelegateMock.currentPassTime) its different from expected: \(desiredSeconds)")
            expectation.fulfill()
        }
        wait(for: [expectation],
             timeout: timeOutForTests)
    }

    /// Tests that success fail that passed 5 seconds and try to count 10
    func testsFailCountsForTenSecondsFine() throws {
        // GIVEN
        let sut: SKSheduleTimer = try XCTUnwrap(self.sut)
        let sutDelegateMock: SKSheduleTimerDelegateMock = try XCTUnwrap(self.sutDelegateMock)
        let desiredSeconds: TimeInterval = 5.0
        let desiredWrongSeconds: TimeInterval = 10.0
        // THEN
        UIApplication.shared.keyWindow?.rootViewController = mockView
        sut.fire()
        let expectation = XCTestExpectation(description: "testsCountsForFiveSecondsFine")
        DispatchQueue.main.asyncAfter(deadline: .now() + desiredSeconds) {
            XCTAssert(sutDelegateMock.calls.didChangeTime, "Error, not calling to the delegate, in order to communicate the changes")
            XCTAssertNotEqual(sutDelegateMock.currentPassTime, desiredWrongSeconds, "Error, the values should not be the sames")
            expectation.fulfill()
        }
        wait(for: [expectation],
             timeout: timeOutForTests)
    }

}


#else
#endif
