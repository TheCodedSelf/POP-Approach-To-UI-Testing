//
//  ViewTodoScreenVerifying.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/06.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol ViewTodoScreenVerifying {
    func viewTodoScreenIsShowing(forTodoTitled: String) -> Bool
}

extension ViewTodoScreenVerifying {
    func viewTodoScreenIsShowing(forTodoTitled title: String) -> Bool {
        let app = XCUIApplication()
        let dateHeader = app.staticTexts["Is Scheduled For:"]
        let titleLabel = app.staticTexts[title]
        return dateHeader.exists && titleLabel.exists
    }
}
