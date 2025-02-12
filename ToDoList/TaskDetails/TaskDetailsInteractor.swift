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
    func editTask(with name: String, _ description: String, _ date: Date)
}

protocol TaskDetailsInteractorOutputProtocol: AnyObject {
    func receiveTaskDetails(with dataStore: TaskDetailsDataStore)
    func receiveUpdated(task: Task)
    func receiveChanged(task: Task)
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
            name: task.name,
            description: task.descrip ?? "",
            date: task.date ?? nil,
            isDone: task.isDone
        )
        presenter.receiveTaskDetails(with: dataStore)
    }
    
    func toggleIsDoneStatus() {
        StorageManager.shared.toggleTaskIsDone(task: task)
        presenter.receiveUpdated(task: task)
    }
    
    func editTask(with name: String, _ description: String, _ date: Date) {
        StorageManager.shared.edit(
            task,
            with: name,
            description,
            date
        )
        presenter.receiveChanged(task: task)
    }
}
