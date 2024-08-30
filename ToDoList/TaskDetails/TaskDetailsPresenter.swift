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
    private unowned let router: TaskListRouterOutputProtocol
    
    init(view: TaskDetailsViewInputProtocol, router: TaskListRouterOutputProtocol) {
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
    func receiveUpdated(task: Task) {
        view.displayImageForButton(with: task.isDone)
        router.receiveNew(task: task)
    }
    
    func receiveTaskDetails(with dataStore: TaskDetailsDataStore) {
        view.displayTaskName(with: dataStore.name)
        view.displayTaskDescription(description: dataStore.description ?? "")
        view.displayTaskDate(with: dataStore.date?.formatted() ?? "")
        view.displayImageForButton(with: dataStore.isDone)
    }
    
}
