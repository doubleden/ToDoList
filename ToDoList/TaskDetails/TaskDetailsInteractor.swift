//
//  TaskDetailsInteractor.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskDetailsInteractorInputProtocol {
    init(presenter: TaskDetailsInteractorOutputProtocol, task: Task)
    func toggleIsDoneStatus()
    func provideDetails()
}

protocol TaskDetailsInteractorOutputProtocol: AnyObject {
    func receiveTaskDetails(with dataStore: TaskDetailsDataStore)
    func receiveTaskStatus(with status: Bool)
}

final class TaskDetailsInteractor: TaskDetailsInteractorInputProtocol {
    
    private unowned let presenter: TaskDetailsInteractorOutputProtocol
    private let task: Task
    
    init(presenter: TaskDetailsInteractorOutputProtocol, task: Task) {
        self.presenter = presenter
        self.task = task
    }
    
    func provideDetails() {
        let dataStore = TaskDetailsDataStore(
            name: task.name ?? "",
            description: task.descrip ?? "",
            date: task.date ?? nil,
            isDone: task.isDone
        )
        presenter.receiveTaskDetails(with: dataStore)
    }
    
    func toggleIsDoneStatus() {
        StorageManager.shared.toggleTaskIsDone(task: task)
        presenter.receiveTaskStatus(with: task.isDone)
    }
}
