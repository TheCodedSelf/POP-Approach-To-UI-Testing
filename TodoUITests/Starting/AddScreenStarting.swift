//
//  AddScreenStarting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/04.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol AddScreenStarting: AppStarting, StartupConfigurable {
    func startAddScreen()
}

extension AddScreenStarting {
    func startAddScreen() {
        XCUIApplication().navigationBars.buttons[Accessibility.Root.AddButton].tap()
    }
    
    func configureStartup() {
        startApp()
        startAddScreen()
    }
}
