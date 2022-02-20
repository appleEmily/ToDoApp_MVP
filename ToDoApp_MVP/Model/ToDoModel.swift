//
//  ToDoModel.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

protocol ToDoModelInput {
    func fetchItems() -> [String]
    func addItem(itemContent: String, completion: () -> ())
    func deleteItemat(index: Int, completion: () -> ())
//    func addTodo(itemContent: String, completion: () -> ())
}

final class ToDoModel: ToDoModelInput {
    
    private let userdefaults: UserDefaults = UserDefaults.standard
    
    private let todoKey: String = "todoItem"
    //保存されているものを表示するためのpresenterに渡すためのメソッド
    func fetchItems() -> [String] {
        return userdefaults.array(forKey: "todoItem") as! [String]
    }
    
    func addItem(itemContent: String, completion: () -> ()) {
        var items = userdefaults.array(forKey: todoKey) as! [String]
        items.append(itemContent)
        userdefaults.set(items, forKey: todoKey)
        completion()
    }

    func deleteItemat(index: Int, completion: () -> ()) {
        var items = userdefaults.array(forKey: todoKey) as! [String]
        items.remove(at: index)
        userdefaults.set(items, forKey: todoKey)
        completion()
    }
    
}
