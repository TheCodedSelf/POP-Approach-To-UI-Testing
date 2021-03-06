//
//  EditScreenStarting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/19.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol EditScreenStarting: ViewScreenStarting {
    func startEditScreen()
}

extension EditScreenStarting {
    
    func startEditScreen() {
        // Navigate to the view screen
        startViewScreen()
        
        // Tap on the edit button
        XCUIApplication().buttons[Accessibility.View.EditButton].tap()
    }
    
    func configureStartup() {
        startEditScreen()
    }
}
