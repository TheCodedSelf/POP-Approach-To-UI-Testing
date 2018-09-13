//
//  AddScreenTests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/04.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class AddScreenTests: UITestCase, AddScreenStarting, AddScreenVerifying, StandardElementsInteracting, TodoListInteracting {
        
    func testCanMakeNewTodo() {
        let todoTitle = "Buy Christmas Presents"
        
        addTitleTextField.tap()
        addTitleTextField.typeText(todoTitle)
        
        adjustDatePicker(year: "2018", month: "December", day: "24")
        
        addTitleLabel.tap()
        addDoneButton.tap()
        let newTodoElement = todo(titled: todoTitle)
        
        XCTAssertTrue(newTodoElement.exists)
        XCTAssert(newTodoElement.staticTexts["2018-12-24"].exists)
    }
    
}
