//
//  DetailViewController.swift
//  Todo
//
//  Copyright © 2016 YiGu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var childButton: UIButton!
  @IBOutlet weak var phoneButton: UIButton!
  @IBOutlet weak var shoppingCartButton: UIButton!
  @IBOutlet weak var travelButton: UIButton!
  @IBOutlet weak var todoTitleLabel: UILabel!
  @IBOutlet weak var todoTitleTextField: UITextField!
  @IBOutlet weak var todoDatePicker: UIDatePicker!
  @IBOutlet weak var doneButton: UIButton!
    
  var todo: ToDoItem?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let todo = todo {
      self.title = "Edit Todo"
      if todo.image == "child-selected"{
        childButton.isSelected = true
      }
      else if todo.image == "phone-selected"{
        phoneButton.isSelected = true
      }
      else if todo.image == "shopping-cart-selected"{
        shoppingCartButton.isSelected = true
      }
      else if todo.image == "travel-selected"{
        travelButton.isSelected = true
      }
      
      doneButton.accessibilityIdentifier = Accessibility.Edit.DoneButton
      todoTitleTextField.accessibilityIdentifier = Accessibility.Edit.TitleField
      todoTitleLabel.accessibilityIdentifier = Accessibility.Edit.TitleLabel
      todoTitleTextField.text = todo.title
      todoDatePicker.setDate(todo.date, animated: false)
    } else {
      title = "New Todo"
      childButton.isSelected = true
      doneButton.accessibilityIdentifier = Accessibility.Add.Done
      todoTitleTextField.accessibilityIdentifier = Accessibility.Add.Title
    }
  }
  
  // MARK: type select
  @IBAction func selectChild(_ sender: AnyObject) {
    resetButtons()
    childButton.isSelected = true
  }
  
  @IBAction func selectPhone(_ sender: AnyObject) {
    resetButtons()
    phoneButton.isSelected = true
  }
  
  @IBAction func selectShoppingCart(_ sender: AnyObject) {
    resetButtons()
    shoppingCartButton.isSelected = true
  }
  
  @IBAction func selectTravel(_ sender: AnyObject) {
    resetButtons()
    travelButton.isSelected = true
  }
  
  func resetButtons() {
    childButton.isSelected = false
    phoneButton.isSelected = false
    shoppingCartButton.isSelected = false
    travelButton.isSelected = false
  }
  
  // MARK: create or edit a new todo
  @IBAction func tapDone(_ sender: AnyObject) {
    var image = ""
    if childButton.isSelected {
      image = "child-selected"
    }
    else if phoneButton.isSelected {
      image = "phone-selected"
    }
    else if shoppingCartButton.isSelected {
      image = "shopping-cart-selected"
    }
    else if travelButton.isSelected {
      image = "travel-selected"
    }
    
    if let todo = todo {
      todo.image = image
      todo.title = todoTitleTextField.text!
      todo.date = todoDatePicker.date
    } else {
      let uuid = UUID().uuidString
      todo = ToDoItem(id: uuid, image: image, title: todoTitleTextField.text!, date: todoDatePicker.date)
      todos.append(todo!)
    }
    
    let _ = navigationController?.popToRootViewController(animated: true)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
  }
}
