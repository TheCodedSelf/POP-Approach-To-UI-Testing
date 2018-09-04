//
//  AddScreenTests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/04.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class AddScreenTests: UITestCase, AddScreenStarting, AddScreenVerifying, StandardElementsInteracting {
    
    func testCanMakeNewTodo() {
        let todoTitle = "Buy Christmas Presents"
        
        let app = XCUIApplication()
        
        // AddScreenVerifying contains different elements of add screen
        // Type the new title in the title text field
        addTitleTextField.tap()
        addTitleTextField.typeText(todoTitle)
        
        // Use a convenience function in StandardElementsInteracting
        // To modify the date picker
        adjustDatePicker(year: "2018", month: "December", day: "24")
        
        // Hide the keyboard by tapping somewhere else
        addTitleLabel.tap()
        
        // Tap the done button
        addDoneButton.tap()
        
        // Find the todo in the root view
        let newTodoElement = app.cells
            .containing(.staticText, identifier: todoTitle)
            .firstMatch
        
        // Does the new todo exist?
        XCTAssertTrue(newTodoElement.exists)
        
        // Does it have the correct date?
        XCTAssert(newTodoElement.staticTexts["2018-12-24"].exists)
    }
    
}
