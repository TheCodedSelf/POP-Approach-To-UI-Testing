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
        let newTodoTitle = "Foo bar"
        
        let app = XCUIApplication()
        app.textFields[Accessibility.Edit.TitleField].tap()
        app.textFields[Accessibility.Edit.TitleField].clearText()
        app.textFields[Accessibility.Edit.TitleField].typeText(newTodoTitle)
        
        app.staticTexts[Accessibility.Edit.TitleLabel].tap()
        
        app.buttons[Accessibility.Edit.DoneButton].tap()
        
        XCTAssertFalse(todo(titled: titleOfTodoForTest).exists)
        XCTAssertTrue(todo(titled: newTodoTitle).exists)
    }
}
