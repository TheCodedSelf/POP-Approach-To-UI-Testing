//
//  AddScreenVerifying.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/04.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol AddScreenVerifying {
    func addScreenIsShowing() -> Bool
    var addDoneButton: XCUIElement { get }
    var addTitleTextField: XCUIElement { get }
    var addTitleLabel: XCUIElement { get }
}

extension AddScreenVerifying {
    func addScreenIsShowing() -> Bool {
        let app = XCUIApplication()
        return app.navigationBars["New Todo"].exists
         && addTitleLabel.exists
         && addDoneButton.exists
    }
    
    var addDoneButton: XCUIElement {
        return XCUIApplication().buttons[Accessibility.Add.Done]
    }
    
    var addTitleTextField: XCUIElement {
        return XCUIApplication().textFields[Accessibility.Add.Title]
    }
    
    var addTitleLabel: XCUIElement {
        return XCUIApplication().staticTexts["Todo Title:"]
    }
}
