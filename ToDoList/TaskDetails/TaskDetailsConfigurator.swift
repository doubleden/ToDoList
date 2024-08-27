//
//  TaskDetailsConfigurator.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskDetailsConfiguratorProtocol {
    func configure(with view: TaskDetailsViewController, and task: Task)
}

final class TaskDetailsConfigurator: TaskDetailsConfiguratorProtocol {
    
    func configure(with view: TaskDetailsViewController, and task: Task) {
        let presenter = TaskDetailsPresenter(view: view)
        let interactor = TaskDetailsInteractor(presenter: presenter, task: task)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
