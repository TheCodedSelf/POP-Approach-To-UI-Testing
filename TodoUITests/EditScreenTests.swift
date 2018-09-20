//
//  EditScreenTests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/19.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class EditScreenTests: UITestCase, EditScreenStarting, TodoListInteracting {
    
    let titleOfTodoForTest = "Grocery Shopping"

    func testCanChangeTitle() {
        let app = XCUIApplication()
        
        // Find the text field with the identifier assigned to Title Field
        let titleTextField = app.textFields[Accessibility.Edit.TitleField]
        
        // Tap to start editing
        titleTextField.tap()
        
        // Clear the previous title
        titleTextField.clearText()
        
        // Type the new title
        let newTodoTitle = "Attend swift.map"
        titleTextField.typeText(newTodoTitle)
        
        // Tap somewhere else to get rid of the keyboard
        app.staticTexts[Accessibility.Edit.TitleLabel].tap()
        
        // Tap the done button
        app.buttons[Accessibility.Edit.DoneButton].tap()
        
        // Assert that our old todo does not exist
        XCTAssertFalse(todo(titled: titleOfTodoForTest).exists)
        
        // Assert that our new todo does exist
        XCTAssertTrue(todo(titled: newTodoTitle).exists)
    }
}
