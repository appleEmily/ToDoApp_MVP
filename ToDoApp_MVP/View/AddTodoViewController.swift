//
//  AddTodoViewController.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    private var addPresenter: TodoInput!
    
    func inject (addPresenter: TodoInput) {
        self.addPresenter = addPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func addTodo(_ sender: Any) {
        if !textField.text!.isEmpty {
            addPresenter.sendTodo(itemContent: textField.text!)
//            addPresenter.sendTodo(itemContent: addPresenter.newTodo)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension AddTodoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

