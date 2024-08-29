//
//  TaskDetailsConfigurator.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskDetailsConfiguratorProtocol {
    func configure(with view: TaskDetailsViewController, and task: Task, _ router: TaskListRouterInputProtocol)
}

final class TaskDetailsConfigurator: TaskDetailsConfiguratorProtocol {
    
    func configure(with view: TaskDetailsViewController, and task: Task, _ router: TaskListRouterInputProtocol) {
        let presenter = TaskDetailsPresenter(view: view, router: router)
        let interactor = TaskDetailsInteractor(presenter: presenter, task: task)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
