//
//  TodoListInteracting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/06.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol TodoListInteracting {
    func todo(titled: String) -> XCUIElement
}

extension TodoListInteracting {
    func todo(titled title: String) -> XCUIElement {
        // Find a todo in the root view
        return XCUIApplication().cells
            .containing(.staticText, identifier: title)
            .firstMatch
    }
}
