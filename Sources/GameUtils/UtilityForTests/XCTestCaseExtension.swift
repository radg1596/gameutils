//
//  XCTestCaseExtension.swift
//  
//
//  Created by Ricardo Desiderio on 28/03/21.
//

import XCTest

extension XCTestCase {

    func runTestExpectation(waitTime: TimeInterval = 3.0,
                                 code: () throws -> Void,
                                 messageString: String = "",
                                 file: StaticString = #file,
                                 line: UInt = #line) {
        let uniqueId: String = UUID().uuidString
        let testExpectation: XCTestExpectation = XCTestExpectation(description: uniqueId)
        do {
            try code()
            testExpectation.fulfill()
        } catch {
            XCTFail(messageString, file: file, line: line)
        }
    }

}
