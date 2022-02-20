//
//  AddToDomodel.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

protocol addTodoModelInput {
    func addTodo(itemContent: String, completion: () -> ())
}

final class AddToDoModel: addTodoModelInput {
    
//    private var addTodoPresenter: AddTodoInput!
    
    private let userdefaults: UserDefaults = UserDefaults.standard
    

    
}
