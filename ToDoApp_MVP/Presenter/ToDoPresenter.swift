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
    
}

//viewに伝えるメソッドを持っている。
protocol ToDoPresenterOutput: AnyObject {
    func updateItems()
}

//final消してみた
class ToDoPresenter: ToDoPresenterInput {
    
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
    
    //ここが使われていない
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
    
}
