//
//  ViewTodoTests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/13.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class ViewTodoTests: UITestCase, ViewScreenStarting, ViewTodoScreenVerifying, EditScreenVerifying {
    
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
        // Find button with Edit button's identifier
        let edit = XCUIApplication().buttons[Accessibility.View.EditButton]
        
        edit.tap()
        
        // Assert that the edit screen is showing
        XCTAssertTrue(editScreenIsShowing())
    }
}
