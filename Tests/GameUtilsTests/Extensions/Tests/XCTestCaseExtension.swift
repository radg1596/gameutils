//
//  XCTestCaseExtension.swift
//  
//
//  Created by Ricardo Desiderio on 29/03/21.
//

import Foundation
import XCTest
@testable import GameUtils

/**
 Tests for the extension of the XCTestCase, only will be used the tests when success, not when fails because will be tests failing
 */
class XCTestCaseExtensionTests: XCTestCase {

    // MARK: - PROPERTIES
    private var sut: XCTestCase?
    private let expectedResultForAsync: Bool = true

    //MARK: - TEST LIFE CYCLE
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    override func setUp() {
        super.setUp()
        sut = self
    }

    // MARK: - TESTS
    /// Test that the component not throws some error when success pass the closure
    func testSuccessFailExpectationAsync() throws {
        // GIVEN
        let sut: XCTestCase = try XCTUnwrap(self.sut)
        // WHEN
        let timeOutExpected: TimeInterval = 3.0
        // THEN
        sut.runTestExpectation(waitTime: timeOutExpected) {
            XCTAssert(true)
        }
    }

    /// Tests success run an async test simulating the delay with 10 seconds
    func testSuccessRunAsyncTest10Seconds() throws {
        // GIVEN
        let sut: XCTestCase = try XCTUnwrap(self.sut)
        // WHEN
        let timeOutExpected: TimeInterval = 10.0
        let realTimeOut: TimeInterval = 8.0
        // THEN
        sut.runTestExpectation(waitTime: timeOutExpected) {
            testAsyncEnviroment(time: realTimeOut) { (result: Bool) in
                XCTAssert(result)
            }
        }
    }

    /// Tests success run an async test simulating the delay with 5 seconds
    func testSuccessRunAsyncTest5Seconds() throws {
        // GIVEN
        let sut: XCTestCase = try XCTUnwrap(self.sut)
        // WHEN
        let timeOutExpected: TimeInterval = 5.0
        let realTimeOut: TimeInterval = 1.0
        // THEN
        sut.runTestExpectation(waitTime: timeOutExpected) {
            testAsyncEnviroment(time: realTimeOut) { (result: Bool) in
                XCTAssert(result)
            }
        }
    }

    // MARK: - OWN METHODS
    /// Tests async enviroment, simulates delay
    /// - Parameters:
    ///   - completion: Completion called after async simulation
    ///   - time: The time to wait
    func testAsyncEnviroment(time: TimeInterval, completion: @escaping (_ result: Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            completion(self.expectedResultForAsync)
        }
    }

}
