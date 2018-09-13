//
//  ViewScreenStarting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/13.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol ViewScreenStarting: RootViewStarting, TodoListInteracting {
    func startViewScreen()
    
    // What Todo are we testing?
    var titleOfTodoForTest: String { get }
}

extension ViewScreenStarting {
    func startViewScreen() {
        // First start on the root view
        startRootView()
        
        // Tap on the todo with the correct title
        todo(titled: titleOfTodoForTest).tap()
    }
    
    func configureStartup() {
        startViewScreen()
    }
}
