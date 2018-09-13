//
//  ViewTodoViewController.swift
//  Todo
//
//  Created by Keegan Rush on 2018/09/03.
//  Copyright © 2018 YiGu. All rights reserved.
//

import UIKit

private enum ViewTodoState {
    case initial
    case loaded(ToDoItem)
}

class ViewTodoViewController: UIViewController {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    private var state = ViewTodoState.initial {
        didSet {
            switch state {
            case .loaded(let todo):
                titleLabel.text = todo.title
                dateLabel.text = stringFromDate(todo.date)
                categoryImageView.image = UIImage(named: todo.image)
            default:
                return
            }
        }
    }
    
    func populate(with todo: ToDoItem) {
        preloadView()
        state = .loaded(todo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteButton.accessibilityIdentifier = Accessibility.View.DeleteButton
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = Accessibility.View.EditButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTodo" {
            guard case let .loaded(todo) = state else { return }
            let vc = segue.destination as! DetailViewController
            vc.todo = todo
        }
    }
    
    private func preloadView() {
        _ = view
    }
    
    @IBAction private func share(_ sender: Any) {
        guard case let .loaded(todo) = state else { return }
        let message = "I need to complete \(todo.title) by \(stringFromDate(todo.date))!"
        let activityViewController = UIActivityViewController(
            activityItems: [message],
            applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = {
            (_, completed: Bool, _, activityError: Error?) -> Void in
            guard completed else {
                print("Error with share activity: \(String(describing: activityError))")
                return
            }
        }
        
        self.present(activityViewController, animated: true)
    }
    
    
    @IBAction private func deleteTodo(_ sender: Any) {
        guard case let .loaded(todo) = state else { return }
        todo.markedForDeletion = true
        _ = self.navigationController?.popViewController(animated: true)
        
    }
}
