//
//  AddTaskConfigurator.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import Foundation

protocol AddTaskConfiguratorProtocol {
    func configure(with view: AddTaskViewController, and router: TaskListRouterInputProtocol)
}

final class AddTaskConfigurator: AddTaskConfiguratorProtocol {
    func configure(with view: AddTaskViewController, and router: TaskListRouterInputProtocol) {
        let presenter = AddTaskPresenter(view: view, router: router)
        let interactor = AddTaskInteractor(presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
