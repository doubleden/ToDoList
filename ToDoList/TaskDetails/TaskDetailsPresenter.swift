//
//  TaskDetailsPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

struct TaskDetailsDataStore {
    let name: String
    let description: String?
    let date: Date?
    let isDone: Bool
}

final class TaskDetailsPresenter: TaskDetailsViewOutputProtocol {
    
    var interactor: TaskDetailsInteractorInputProtocol!
    private unowned let view: TaskDetailsViewInputProtocol
    private unowned let router: TaskListRouterInputProtocol
    
    init(view: TaskDetailsViewInputProtocol, router: TaskListRouterInputProtocol) {
        self.view = view
        self.router = router
    }
    
    func showDetails() {
        interactor.provideDetails()
    }
    
    func doneButtonWasPressed() {
        interactor.toggleIsDoneStatus()
    }
}

// MARK: - TaskDetailsInteractorOutputProtocol
extension TaskDetailsPresenter: TaskDetailsInteractorOutputProtocol {
    func receiveTaskStatus(with status: Bool) {
        view.displayImageForButton(with: status)
        router.updateViewList()
    }
    
    func receiveTaskDetails(with dataStore: TaskDetailsDataStore) {
        view.displayTaskName(with: dataStore.name)
        view.displayTaskDescription(description: dataStore.description ?? "")
        view.displayTaskDate(with: dataStore.date?.formatted() ?? "")
    }
    
}
