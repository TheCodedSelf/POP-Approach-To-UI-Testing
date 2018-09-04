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
}

extension AddScreenVerifying {
    func addScreenIsShowing() -> Bool {
        let app = XCUIApplication()
        
        // Verify elements on Add Screen exist
        return app.navigationBars["New Todo"].exists
         && app.staticTexts["Todo Title:"].exists
         && app.buttons[Accessibility.Add.Done].exists
    }
}
