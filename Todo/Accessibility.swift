//
//  Accessibility.swift
//  Todo
//
//  Created by Keegan Rush on 2018/09/03.
//  Copyright © 2018 YiGu. All rights reserved.
//

import Foundation

enum Accessibility {
    enum Root {
        static let AddButton = "Add Todo"
    }
    
    enum Add {
        static let Done = "Done"
        static let Title = "Title"
    }
    
    enum View {
        static let DeleteButton = "Delete Todo"
        static let EditButton = "Edit Todo"
    }
    
    enum Edit {
        static let DoneButton = "Done Editing"
        static let TitleField = "Edit Todo Title"
        static let TitleLabel = "Edit Todo Title Label"
    }
}
