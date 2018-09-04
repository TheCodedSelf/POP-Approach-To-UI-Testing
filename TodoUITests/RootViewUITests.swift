//
//  RootViewUITests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/08/30.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class RootViewUITests: UITestCase, RootViewStarting, AddScreenVerifying, StandardElementsInteracting {

    func testNavigatesToAddScreen() {
        XCUIApplication().navigationBars.buttons[Accessibility.Root.AddButton].tap()
        XCTAssertTrue(addScreenIsShowing())
        
        let todoTitle = "Buy Christmas Presents"
        
        let app = XCUIApplication()
        addTitleTextField.tap()
        addTitleTextField.typeText(todoTitle)
        
        adjustDatePicker(year: "2018", month: "December", day: "24")

        app.staticTexts["Todo Title:"].tap()
        addDoneButton.tap()
        let newTodoElement = app.cells
            .containing(.staticText, identifier: todoTitle)
            .firstMatch
        
        XCTAssertTrue(newTodoElement.exists)
        XCTAssert(newTodoElement.staticTexts["2018-12-24"].exists)
    }
    
}
