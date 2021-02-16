import XCTest
@testable import GameUtils

final class GameUtilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GameUtils().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}


class PlayerNameUserDefaultsStorageTests: XCTestCase {

    // MARK: - PROPERTIES
    private var sut: PlayerNameUserDefaultsStorage?

    // MARK: - TEST CYCLE LIFE
    override func tearDown() {
        super.tearDown()
        sut?.clearName()
        sut = nil
    }

    override func setUp() {
        super.setUp()
        sut = PlayerNameUserDefaultsStorage()
    }

    // MARK: - TESTS
    /// Tests sucess save a name on user defaults
    func testsSuccessSaveName() {
        // GIVEN
        let pathKeyForTests: String = "pathKeyForTests"
        let expectedName: String = "Rick"
        // THEN
        sut?.storageKey = pathKeyForTests
        sut?.saveNew(userName: expectedName)
        XCTAssertNotNil(sut?.currentUserName, "Error, not saving the name on userdefaults")
    }

    /// Tests success save a name, and retrieve the same value
    func testsSuccessRetreiveSavedName() {
        // GIVEN
        let pathKeyForTests: String = "pathKeyForTests"
        let expectedName: String = "Rick"
        // THEN
        sut?.storageKey = pathKeyForTests
        sut?.saveNew(userName: expectedName)
        XCTAssertEqual(sut?.currentUserName, expectedName, "Error, not retreive the expected username")
    }

}
