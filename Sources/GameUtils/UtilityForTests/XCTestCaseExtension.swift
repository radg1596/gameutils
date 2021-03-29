//
//  XCTestCaseExtension.swift
//  
//
//  Created by Ricardo Desiderio on 28/03/21.
//

import XCTest

public extension XCTestCase {

    /// Excecutes an async test expectation. Creates an expectation and try to run the code
    /// - Parameters:
    ///   - waitTime: The wait time for expectation
    ///   - code: The code to excute after the time
    ///   - messageString: The message to display the error
    ///   - file: The file of the source
    ///   - line: The line of code of the source
    func runTestExpectation(waitTime: TimeInterval = 3.0,
                            code: () throws -> Void,
                            messageString: String = "",
                            file: StaticString = #file,
                            line: UInt = #line) {
        let uniqueId: String = UUID().uuidString
        let testExpectation: XCTestExpectation = XCTestExpectation(description: uniqueId)
        do {
            try code()
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                testExpectation.fulfill()
            }
        } catch {
            XCTFail(messageString, file: file, line: line)
        }
        wait(for: [testExpectation],
             timeout: waitTime + 1.0)
    }

}
