//
//  ToDoPresenter.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

//presenter

protocol ToDoPresenterInput {
    //todoitemの数は、modelに保存されている数によるので、get(受け取る)のみで良い
    var numberOfItems: Int {get}
    func item(forRow row: Int) -> String?
    func viewDidLoad()
    
}

protocol ToDoPresenterOutput: AnyObject {
    func updateItems()
}

final class ToDoPresenter: ToDoPresenterInput {
    
    private(set) var items: [String] = []
    
    private weak var view: ToDoPresenterOutput!
    private var model: ToDoModelInput
    
    init(view: ToDoPresenterOutput, model: ToDoModelInput) {
        self.view = view
        self.model = model
    }
    
    //何個cellを表示するか。
    var numberOfItems: Int {
        return items.count
    }
    
    func item(forRow row: Int) -> String? {
        guard row < items.count else {
            print(items)
            return nil
        }
        print("いけてるよ")
        return items[row]
    }
    
    
    func viewDidLoad() {
        //modelから保存されているものを受け取る
        //fetchItemsでは[String]で帰ってくる
        items = model.fetchItems()
        //viewにtableの更新命令を出す
        //tableの更新に関するコードはviewに書いてある。
        view.updateItems()
        print("done")
    }
    
}
