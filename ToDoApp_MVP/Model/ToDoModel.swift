//
//  ToDoModel.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

protocol ToDoModelInput {
    func fetchItems() -> [String]
    func addTodo(itemContent: String, completion: () -> ())
}

final class ToDoModel: ToDoModelInput {
    
    private let userdefaults: UserDefaults = UserDefaults.standard
    
    //保存されているものを表示するためのpresenterに渡すためのメソッド
    func fetchItems() -> [String] {
        return userdefaults.array(forKey: "todoItem") as! [String]
    }
    
    //userdefaultsに保存する。presenterから送られてきたものを。
    func addTodo(itemContent: String, completion: () -> ()) {
        //newTodoにまだ値を入れてないので、エラーが出てる。
        userdefaults.set(ToDoPresenter.newTodo, forKey: "newTodo")
    }
    
}
