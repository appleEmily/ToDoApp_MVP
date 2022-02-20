//
//  AppDelegate.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UserDefaults.standard.register(defaults: ["todoItem": ["item1","やほー","jj","hh"]])
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ToDoViewController
        let model = ToDoModel()
        //ここで作ってる。イニシャライズ(インスタンスを生成)
        let presenter = ToDoPresenter(view: view, model: model)
        
        //presenterとviewを紐付ける
        view.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
        return true
    }

}

