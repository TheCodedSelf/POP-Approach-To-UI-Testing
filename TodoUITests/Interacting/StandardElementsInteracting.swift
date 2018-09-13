//
//  StandardElementsInteracting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/04.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol StandardElementsInteracting {
    func adjustDatePicker(year: String, month: String, day: String)
}

extension StandardElementsInteracting {
    func adjustDatePicker(year: String, month: String, day: String) {
        let datePickers = XCUIApplication().datePickers
        datePickers.pickerWheels.element(boundBy: 0)
            .adjust(toPickerWheelValue: month)
        datePickers.pickerWheels.element(boundBy: 1)
            .adjust(toPickerWheelValue: day)
        datePickers.pickerWheels.element(boundBy: 2)
            .adjust(toPickerWheelValue: year)
    }
    
    func shareSheetShows(afterDelay seconds: TimeInterval) -> Bool {
        let app = XCUIApplication()
        let copyButton = app.buttons["Copy"]
        let cancelButton = app.buttons["Cancel"]
        
        let buttonsExist = copyButton.waitForExistence(timeout: seconds) &&
            cancelButton.waitForExistence(timeout: seconds)
        let buttonsAreHittable = copyButton.isHittable &&
            cancelButton.isHittable
        
        return buttonsExist && buttonsAreHittable
    }
}
