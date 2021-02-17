//
//  GULocalizablesMethodsTests.swift
//  
//
//  Created by Ricardo Desiderio on 16/02/21.
//

import XCTest
@testable import GameUtils

class GULocalizablesMethodsTests: XCTestCase {

    // MARK: - PROPERTIES
    var sut: String?

    //MARK: - TEST LIFE CYCLE
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    override func setUp() {
        super.setUp()
        sut = "some_localizable_string"
    }

    // MARK: - TESTS
    /// Tests success fail finding a localizable string from a table that not exist
    func testSuccessFailToGetLocalizableString() throws {
        // GIVEN
        let sut: String = try XCTUnwrap(self.sut)
        let someTableName: String = "someTableName"
        let expectedFailString: String = "**some_localizable_string**"
        // THEN
        XCTAssertEqual(sut.localized(tableName: someTableName),
                       expectedFailString,
                       "Getting a localizable string from a table that not exist...")
    }

    /// Tests success fail to get a localizable string from an inexistent table, using  ´GULocalizableRawValueEnum´
    func testSuccessFailToGetGULocalizableRawValueEnumProtocolLocalizable() {
        // GIVEN
        let someEnumCase: GULocalizableRawValueEnum = GULocalizableRawValueEnum.someCase
        let expectedFailString: String = "**someCase**"
        // THEN
        XCTAssertEqual(someEnumCase.localize,
                       expectedFailString,
                       "Getting a localizable string from a table that not exist...")
    }

}
