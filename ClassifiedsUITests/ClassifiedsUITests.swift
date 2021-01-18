//
//  ClassifiedsUITests.swift
//  ClassifiedsUITests
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import XCTest

class ClassifiedsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    func testThatUserCanNavigateToDetailScreen() throws {

        // Given: user is on the app

        let app = XCUIApplication()
        app.launch()

        sleep(10) // wait for UI to load

        // When: user taps on the listing item

        app.tables.cells.containing(.staticText, identifier: "Notebook").element.tap()

        // Then: verify that user is on the detail screen

        XCTAssert(app.navigationBars["Detail"].exists)
    }
}
