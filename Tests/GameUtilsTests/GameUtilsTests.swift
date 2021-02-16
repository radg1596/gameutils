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
