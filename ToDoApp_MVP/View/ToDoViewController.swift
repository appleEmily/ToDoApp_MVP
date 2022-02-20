//
//  ToDoViewController.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import UIKit

//View

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    private var presenter: ToDoPresenterInput!
    
    func inject (presenter: ToDoPresenterInput) {
        self.presenter = presenter
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        /*presenterのviewdidloadを読み込む。
         ①modelにtodoItemを準備させる。
         ②受け取る
         ③view(このclass)に命令する
         */
        presenter.viewDidLoad()
        
    }
}

//このviewからpresenterに送るもの
extension ToDoViewController: ToDoPresenterOutput {
    func updateItems() {
        table.reloadData()
    }
}
//todoを表示するため
extension ToDoViewController: UITableViewDataSource {
    //presenterが持っている、modelから受け取ってtodoの個数を使う
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ふ")
        return presenter.numberOfItems
    }
    
    //ここが実行できていない
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)
        print("ほい！")
//        print("ぎょ",presenter.item)
//        cell.textLabel?.text = presenter.items[indexPath.row]
        
        return cell
    }
}


extension ToDoViewController: UITableViewDelegate {

}
