//
//  RootViewStarting.swift
//  TodoUITests
//
//  Created by Keegan Rush on 2018/09/03.
//  Copyright © 2018 YiGu. All rights reserved.
//

import XCTest

protocol RootViewStarting: StartupConfigurable, AppStarting {
    func startRootView()
}

extension RootViewStarting {
    
    func startRootView() {
        // Use AppStarting to start the app
        startApp()
    }
    
    func configureStartup() {
        startRootView()
    }
}
