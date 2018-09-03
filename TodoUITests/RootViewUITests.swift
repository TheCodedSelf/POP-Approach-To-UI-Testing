//
//  RootViewUITests.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/08/30.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class RootViewUITests: UITestCase, RootViewStarting {

    func testNavigatesToAddScreen() {
        XCUIApplication().navigationBars.buttons[Accessibility.Root.AddButton].tap()
    }
    
}
