//
//  ToDoPresenter.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

//presenter

//model,viewから持ってくるための準備
protocol ToDoPresenterInput {
    //todoitemの数は、modelに保存されている数によるので、get(受け取る)のみで良い
    var numberOfItems: Int {get}
    func item(forRow row: Int) -> String?
    func viewDidLoad()
    func addNewItem(itemContent: String)
    func deleteCell(at indexPath: IndexPath)
}

//viewに伝えるメソッドを持っている。
protocol ToDoPresenterOutput: AnyObject {
    func updateItems()
}

//final消してみた
final class ToDoPresenter: ToDoPresenterInput {
    
    private(set) var items: [String] = []
    //新しいtodoを受け取る。
    var newTodo: String = ""
    
    private weak var view: ToDoPresenterOutput!
    
    private var model: ToDoModelInput
    
    //コンストラクター
    init(view: ToDoPresenterOutput, model: ToDoModelInput) {
        self.view = view
        self.model = model
    }
    
    //何個cellを表示するか。
    var numberOfItems: Int {
        return items.count
    }
    
    //ここがいまいち何してるかわからない。
    func item(forRow row: Int) -> String? {
        //row < items.countが成り立たない時。つまり、items.countがnilの時
        guard row < items.count else {
            print("nil")
            return nil
        }
        print("good", row)
        
        return items[row]
    }
    
    func viewDidLoad() {
        //modelから保存されているものを受け取る
        //fetchItemsでは[String]で帰ってくる
        items = model.fetchItems()
        print("modelから", items)
        
        //viewにtableの更新命令を出す
        //tableの更新に関するコードはviewに書いてある。
        view.updateItems()
        
        print("done")
    }
    func getTodoArray() {
        items = model.fetchItems()
        print("modelから", items)
    }
    //新しいのを追加する。
    func addNewItem(itemContent: String) {
        model.addItem(itemContent: itemContent) {
            items = model.fetchItems()
            view.updateItems()
        }
    }
    
    func deleteCell(at indexPath: IndexPath) {
        //modelのcellを削除する
        model.deleteItemat(index: indexPath.row) {
            items = model.fetchItems()
            view.updateItems()
        }
    }
    
    
}
