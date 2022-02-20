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

        table.dataSource = self
        table.delegate = self
        
        /*presenterのviewdidloadを読み込む。
         ①modelにtodoItemを準備させる。
         ②受け取る
         ③view(このclass)に命令する
         */
        print("ぬ")
        presenter.viewDidLoad()
        print(presenter.item(forRow: 1)!)
        print("頬")
        
    }
}



//このviewからpresenterに送るもの
extension ToDoViewController: ToDoPresenterOutput {
    func updateItems() {
        
        table.performBatchUpdates({
            self.table.reloadData()
        }) { (finished) in
            print("reload完了しました🙂")
        }
        print("更新した")
    }
}
//todoを表示するため
extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)

        return cell
    }
    
}


extension ToDoViewController: UITableViewDelegate {

}
