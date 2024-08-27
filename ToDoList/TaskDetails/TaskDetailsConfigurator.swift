//
//  TaskDetailsConfigurator.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskDetailsConfiguratorProtocol {
    func configure(with view: TaskDetailsViewController)
}

final class TaskDetailsConfigurator: TaskDetailsConfiguratorProtocol {
    
    func configure(with view: TaskDetailsViewController) {
        let presenter = TaskDetailsPresenter(view: view)
        let interactor = TaskDetailsInteractor(presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
