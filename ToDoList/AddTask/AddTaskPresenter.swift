//
//  AddTaskPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import Foundation

struct AddTaskDataStore {
    let name: String
    let description: String
    let date: Date
}

final class AddTaskPresenter: AddTaskViewOutputProtocol {
    
    private unowned let view: AddTaskViewInputProtocol
    private unowned let router: TaskListRouterOutputProtocol
    var interactor: AddTaskInteractorInputProtocol!
    
    init(view: AddTaskViewInputProtocol, router: TaskListRouterOutputProtocol) {
        self.view = view
        self.router = router
    }
    
    func saveButtonPressed(taskName: String, taskDescription: String, taskDate: Date) {
        let newTask = AddTaskDataStore(
            name: taskName,
            description: taskDescription,
            date: taskDate
        )
        
        interactor.saveTask(data: newTask)
    }
}

extension AddTaskPresenter: AddTaskInteractorOutputProtocol {
    func wasSave(task: Task) {
        router.receiveNew(task: task)
        view.dismiss()
    }
}
