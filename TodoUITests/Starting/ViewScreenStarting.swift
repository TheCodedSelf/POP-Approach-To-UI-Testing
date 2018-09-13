//
//  ViewScreenStarting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/13.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol ViewScreenStarting: AppStarting, StartupConfigurable, TodoListInteracting {
    func startViewScreen()
    var titleOfTodoForTest: String { get }
}

extension ViewScreenStarting {
    func startViewScreen() {
        todo(titled: titleOfTodoForTest).tap()
    }
    
    func configureStartup() {
        startApp()
        startViewScreen()
    }
}
