//
//  ToDoModel.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

protocol ToDoModelInput {
    func fetchItems() -> [String]
}

final class ToDoModel: ToDoModelInput {
    
    private let userdefaults: UserDefaults = UserDefaults.standard
    
    //保存されているものを表示するためのpresenterに渡すためのメソッド
    func fetchItems() -> [String] {
        return userdefaults.array(forKey: "todoItem") as! [String]
    }
}
