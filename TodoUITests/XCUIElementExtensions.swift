//
//  XCUIElementExtensions.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/19.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

extension XCUIElement {
    func clearText(file: StaticString = #file, line: UInt = #line) {
        guard let currentValue = value as? String else {
            XCTFail("Attempted to clear text in a non-textual UI element",
                    file: file, line: line)
            return
        }
        
        let deleteText: String = currentValue.reduce("", { partialResult, _ in
            partialResult + XCUIKeyboardKey.delete.rawValue
        })
        typeText(deleteText)
    }
}
