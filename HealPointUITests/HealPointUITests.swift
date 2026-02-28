//
//  HealPointUITests.swift
//  HealPointUITests
//
//

import XCTest

final class HealPointUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    @MainActor
    func testOnboardingScreenElementsExist() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["HealPoint"].exists)
        XCTAssertTrue(app.buttons["Sign in as Patient"].exists)
        XCTAssertTrue(app.buttons["Sign in as Doctor"].exists)
    }

    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
