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
    
    //privateをつけてあげて守った方が、勝手にpresenterが変わらないよ！
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
        presenter.viewDidLoad()
        
        
    }
    
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddPage" {
            let nextView = segue.destination as! AddTodoViewController
            nextView.inject(presenter: self.presenter)
        }
    }
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "toAddPage", sender: nil)
    }
}



//このviewからpresenterに送るもの
extension ToDoViewController: ToDoPresenterOutput {
    func updateItems() {
            self.table.reloadData()
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

//cellのスワイプ削除を可能にする
extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteCell(at: indexPath)
        }
    }
}

