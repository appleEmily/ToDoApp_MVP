//
//  ToDoViewController.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import UIKit



class ToDoViewController: UIViewController {
    
    private var presenter: ToDoPresenterInput!
        func inject (presenter: ToDoPresenterInput) {
            self.presenter = presenter
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
