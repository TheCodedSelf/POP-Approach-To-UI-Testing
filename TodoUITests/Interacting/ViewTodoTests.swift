//
//  ViewTodoTests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/13.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class ViewTodoTests: UITestCase, ViewScreenStarting, ViewTodoScreenVerifying, StandardElementsInteracting {
    
    let titleOfTodoForTest = "Go to Gym"
    
    func testCanDeleteTodo() {
        let delete = XCUIApplication().buttons[Accessibility.View.DeleteButton]
        delete.tap()
        XCTAssertFalse(viewTodoScreenIsShowing(forTodoTitled: titleOfTodoForTest))
        XCTAssertFalse(todo(titled: titleOfTodoForTest).waitForExistence(timeout: 1))
    }
    
    func testCanShareTodo() {
        let share = XCUIApplication().buttons[Accessibility.View.ShareButton]
        share.tap()
        XCTAssertTrue(shareSheetShows(afterDelay: 3))
    }
}
