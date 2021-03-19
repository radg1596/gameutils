//
//  DoubleExtensionTests.swift
//  
//
//  Created by Ricardo Desiderio on 15/03/21.
//

import Foundation
import XCTest
@testable import GameUtils

class DoubleExtensionTests: XCTestCase {

    // MARK: - PROPERTIES
    var sut: Double?

    //MARK: - TEST LIFE CYCLE
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    override func setUp() {
        super.setUp()
        sut = Double.zero
    }

    // MARK: - TESTS
    /// Tests success gets the string from a score double
    func testSuccessGetsTheformattedScore() throws {
        // GIVEN
        let inputDouble: Double = 35.345043
        let expectedOutput: String = "35.3450"
        // THEN
        sut = inputDouble
        let sut: Double = try XCTUnwrap(self.sut)
        XCTAssertEqual(sut.scoreValue(),
                       expectedOutput,
                       "Cant parse the double to a formatted score")
    }

    /// Tests success gets the string from a score double, with a custom string format
    func testSuccessGetsTheFormattedScoreWithCusmtom() throws {
        // GIVEN
        let inputDouble: Double = 35.345043
        let formatCustom: String = "%.6f"
        let expectedOutput: String = "35.3450"
        // THEN
        sut = inputDouble
        let sut: Double = try XCTUnwrap(self.sut)
        XCTAssertEqual(sut.scoreValue(format: formatCustom),
                       expectedOutput,
                       "Cant parse the double to a formatted score")
    }

}
