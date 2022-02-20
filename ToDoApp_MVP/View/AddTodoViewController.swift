//
//  AddTodoViewController.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import UIKit


//UIKitが優しいから勝手にインスタンスを生成してくれてる
class AddTodoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    //presenterを用意
    private var presenter: ToDoPresenterInput!
    
    
    func inject (presenter: ToDoPresenterInput) {
        self.presenter = presenter
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        presenter.addViewload()
    }
    //追加ボタンを押した時のアクション
    @IBAction func addTodo(_ sender: Any) {
        if !textField.text!.isEmpty {
            print(textField.text!)
            presenter.addNewItem(itemContent: textField.text!)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension AddTodoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}



