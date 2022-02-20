//
//  AddToDoPresenter.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation


//presenter
//protocol AddTodoInput {
//    func sendTodo(itemContent: String)
//    //viewでaddを押したときにtextFieldに入っている値をここに入れる。
//    var newTodo: String {set get}
//}


//final class AddToDoPresenter: AddTodoInput {
//
//    private(set) var items: [String] = []
//    var newTodo: String = ""
//    private weak var view: ToDoPresenterOutput!
//    private var model: ToDoModelInput!
//    private var addModel: addTodoModelInput!
//
//
//
//    //newTodoをmodelに送る。
    //modelの00ってできればいける
//    func sendTodo() {
//        print(newTodo)
//        addModel.addTodo()
//    }
    
//    func sendTodo(itemContent: String) {
//        addModel.addTodo(itemContent: itemContent) {
//            items = model.fetchItems()
//            print("最新", items)
//            items.append(itemContent)
//            view.updateItems()
//        }
//    }
//}
