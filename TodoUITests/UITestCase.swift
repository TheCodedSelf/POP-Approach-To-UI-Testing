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
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        (self as? StartupConfigurable)?.configureStartup()
    }
    
}
