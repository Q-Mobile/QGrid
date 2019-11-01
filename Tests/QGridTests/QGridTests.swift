@testable import QGrid
import SwiftUI
import XCTest

class QGridTests: XCTestCase {
    static var allTests = [
        ("QGrid", testQGrid),
    ]

    // MARK: - Identifiable data

    struct TestData: Identifiable {
        var id = UUID()
        let text: String
    }

    // MARK: - Tests

    func testQGrid() {
        let array = [
            TestData(text: "Person"),
            TestData(text: "Place"),
            TestData(text: "Thing"),
        ]

        let grid = QGrid(array, columns: 2) {
            Text($0.text)
        }

        XCTAssertEqual(grid.columns, 2)
        XCTAssertEqual(grid.columnsInLandscape, 2)
        XCTAssertEqual(grid.vSpacing, 10)
        XCTAssertEqual(grid.hSpacing, 10)
        XCTAssertEqual(grid.vPadding, 10)
        XCTAssertEqual(grid.hPadding, 10)
    }
}
