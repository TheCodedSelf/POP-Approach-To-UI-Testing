//
//  UITestCase.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/03.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

class UITestCase: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        // If the test is StartupConfigurable test, then call configureStartup()
        (self as? StartupConfigurable)?.configureStartup()
    }
    
}
