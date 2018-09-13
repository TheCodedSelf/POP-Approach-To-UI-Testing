//
//  ViewTodoTests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/13.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class ViewTodoTests: UITestCase, ViewScreenStarting, ViewTodoScreenVerifying {
    
    let titleOfTodoForTest = "Go to Gym"
    
    func testCanDeleteTodo() {
        
        // Find button with Delete's identifier
        let delete = XCUIApplication().buttons[Accessibility.View.DeleteButton]
        
        delete.tap()
        
        // Assert view screen is not showing
        XCTAssertFalse(viewTodoScreenIsShowing(forTodoTitled: titleOfTodoForTest))
        
        // Assert that the todo doesn't exist
        XCTAssertFalse(todo(titled: titleOfTodoForTest).waitForExistence(timeout: 1))
    }
    
    func testCanNavigateToEditScreen() {
        let app = XCUIApplication()
        
        // Find button with Edit button's identifier
        let edit = app.buttons[Accessibility.View.EditButton]
        
        edit.tap()
        
        // Find various fields on edit screen
        let titleLabel = app.staticTexts["Todo Title:"]
        let titleTextField = app.textFields[Accessibility.Edit.TitleField]
        let doneButton = app.buttons[Accessibility.Edit.DoneButton]
        let headerLabel = app.navigationBars["Edit Todo"]
        
        // Are all of these fields showing?
        let editScreenIsShowing = titleLabel.exists && titleTextField.exists
            && doneButton.exists && headerLabel.exists
        
        // Assert that the edit screen is showing
        XCTAssertTrue(editScreenIsShowing)
    }
}
