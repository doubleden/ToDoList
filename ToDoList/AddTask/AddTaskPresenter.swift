//
//  AddTaskPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import Foundation

final class AddTaskPresenter: AddTaskViewOutputProtocol {
    
    private unowned let view: AddTaskViewInputProtocol
    private unowned let router: TaskListRouterInputProtocol
    var interactor: AddTaskInteractorInputProtocol!
    
    init(view: AddTaskViewInputProtocol, router: TaskListRouterInputProtocol) {
        self.view = view
        self.router = router
    }
    
    func saveButtonPressed(taskName: String, taskDescription: String, taskDate: Date) {
        interactor.saveTask(with: taskName, taskDescription, taskDate)
    }
}

extension AddTaskPresenter: AddTaskInteractorOutputProtocol {
    
}
