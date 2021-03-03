//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 03/03/21.
//

import Foundation

import XCTest
@testable import GameUtils

class GUSomeGameActionUserCounterTests: XCTestCase {

    // MARK: - PROPERTIES
    private var sut: GUSomeGameActionUserCounter?

    // MARK: - TEST CYCLE LIFE
    override func tearDown() {
        super.tearDown()
        sut?.resetCounter()
        sut = nil
    }

    override func setUp() {
        super.setUp()
        sut = GUSomeGameActionUserCounter()
    }

    // MARK: - TESTS
    /// Tests that success save the number of desired counts
    func testSuccessCountDesiredNumber() {
        // GIVEN
        let desiredCount: Int = 3
        // WHEN
        for _ in Int.zero ..< desiredCount {
            sut?.incrementCounter()
        }
        // THEN
        XCTAssertEqual(desiredCount,
                       sut?.currentCounts,
                       "Not save the right desired counts")
    }

    /// Tests success reach the desired max count, and boolean variable gets true value
    func testSuccessReachDesiredMaxCounter() throws {
        // GIVEN
        let desiredCount: Int = 5
        let maxCountDesired: Int = 5
        let sut: GUSomeGameActionUserCounter = try XCTUnwrap(self.sut)
        // WHEN
        for _ in Int.zero ..< desiredCount {
            sut.incrementCounter()
        }
        sut.maxCounts = maxCountDesired
        // THEN
        XCTAssert(sut.maxCountsReached,
                  "Not reach max count numbers, or boolean fails")
    }

    /// Tests success still not reach the desired max count, and boolean variable gets false value
    func testSuccessStillNotReachDesiredMaxCounter() throws {
        // GIVEN
        let desiredCount: Int = 2
        let maxCountDesired: Int = 10
        let sut: GUSomeGameActionUserCounter = try XCTUnwrap(self.sut)
        // WHEN
        for _ in Int.zero ..< desiredCount {
            sut.incrementCounter()
        }
        sut.maxCounts = maxCountDesired
        // THEN
        XCTAssert(!sut.maxCountsReached,
                  "Gets that max count reached when still has not")
    }

}
