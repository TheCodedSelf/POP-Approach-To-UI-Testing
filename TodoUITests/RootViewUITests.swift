//
//  RootViewUITests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/08/30.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class RootViewUITests: UITestCase, RootViewStarting {

    func testNavigatesToAddScreen() {
        // Find button with AddButton identifer
        let addButton = XCUIApplication().navigationBars
            .buttons[Accessibility.Root.AddButton]
        
        // Tap on the Add button
        addButton.tap()
        
        let app = XCUIApplication()
        
        // Verify elements on Add Screen exist
        let isOnAddScreen = app.navigationBars["New Todo"].exists
            && app.staticTexts["Todo Title:"].exists
            && app.buttons[Accessibility.Add.Done].exists
        
        XCTAssertTrue(isOnAddScreen)
    }
    
}
