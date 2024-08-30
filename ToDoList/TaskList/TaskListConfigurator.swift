//
//  TaskListConfigurator.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskListConfiguratorProtocol {
    func configure(with view: TaskListViewController)
}

final class TaskListConfigurator: TaskListConfiguratorProtocol {
    func configure(with view: TaskListViewController) {
        let presenter = TaskListPresenter(view: view)
        let interactor = TaskListInteractor(presenter: presenter)
        let router = TaskListRouter(view: view, presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
