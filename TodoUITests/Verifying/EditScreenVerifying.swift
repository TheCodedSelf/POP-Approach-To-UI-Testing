//
//  EditScreenVerifying.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/24.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol EditScreenVerifying {
    func editScreenIsShowing() -> Bool
}

extension EditScreenVerifying {
    func editScreenIsShowing() -> Bool {
        let app = XCUIApplication()
        
        // Find various fields on edit screen
        let titleLabel = app.staticTexts["Todo Title:"]
        let titleTextField = app.textFields[Accessibility.Edit.TitleField]
        let doneButton = app.buttons[Accessibility.Edit.DoneButton]
        let headerLabel = app.navigationBars["Edit Todo"]
        
        // Are all of these fields showing?
        return titleLabel.exists && titleTextField.exists
            && doneButton.exists && headerLabel.exists
    }
}
