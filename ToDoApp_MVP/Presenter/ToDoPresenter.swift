//
//  ToDoPresenter.swift
//  ToDoApp_MVP
//
//  Created by Emily Nozaki on 2022/02/20.
//

import Foundation

protocol ToDoPresenterInput {
}

protocol ToDoPresenterOutput: AnyObject {

}

final class ToDoPresenter: ToDoPresenterInput {
    
    private weak var view: ToDoPresenterOutput!
        private var model: ToDoModelInput

        init(view: ToDoPresenterOutput, model: ToDoModelInput) {
            self.view = view
            self.model = model
        }
    
}
