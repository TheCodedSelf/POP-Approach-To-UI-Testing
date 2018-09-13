//
//  RootViewUITests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/08/30.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class RootViewUITests: UITestCase, RootViewStarting, AddScreenVerifying, TodoListInteracting, ViewTodoScreenVerifying {

    func testNavigatesToAddScreen() {
        XCUIApplication().navigationBars.buttons[Accessibility.Root.AddButton].tap()
        XCTAssertTrue(addScreenIsShowing())
    }
    
    func testNavigatesToViewTodoScreen() {
        let todoTitle = "Go to Gym"
        todo(titled: todoTitle).tap()
        XCTAssertTrue(viewTodoScreenIsShowing(forTodoTitled: todoTitle))
    }
    
}
