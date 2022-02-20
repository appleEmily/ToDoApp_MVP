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
    
    //新しいのを追加する時周り
    func sendTodo(itemContent: String)
    //viewでaddを押したときにtextFieldに入っている値をここに入れる。
    var newTodo: String {set get}
}

//viewに伝えるメソッドを持っている。
protocol ToDoPresenterOutput: AnyObject {
    func updateItems()
}

//final消してみた
final class ToDoPresenter: ToDoPresenterInput {
    
    private(set) var items: [String] = []
    var newTodo: String = ""
    
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
    
    func sendTodo(itemContent: String) {
        model.addTodo(itemContent: itemContent) {
            items = model.fetchItems()
            print("最新", items)
            items.append(itemContent)
            view.updateItems()
        }
    }
    
    
}
