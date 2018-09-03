//
//  RootViewStarting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/03.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol RootViewStarting: StartupConfigurable, AppStarting {
    
}

extension RootViewStarting {
    func configureStartup() {
        startApp()
    }
}
