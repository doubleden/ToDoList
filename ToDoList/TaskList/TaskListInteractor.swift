//
//  TaskListInteractor.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskListInteractorInputProtocol {
    init(presenter: TaskListInteractorOutputProtocol)
    func provideTaskData()
}

protocol TaskListInteractorOutputProtocol: AnyObject {
    func receiveTaskData(taskData: TaskListDataStore)
}

final class TaskListInteractor: TaskListInteractorInputProtocol {
    private unowned let presenter: TaskListInteractorOutputProtocol
    
    init(presenter: any TaskListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideTaskData() {
        StorageManager.shared.fetchData { [unowned self] result in
            switch result {
            case .success(let taskList):
                let taskData = TaskListDataStore(tasks: taskList)
                presenter.receiveTaskData(taskData: taskData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
