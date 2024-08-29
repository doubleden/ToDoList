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
    func delete(task: Task)
}

protocol TaskListInteractorOutputProtocol: AnyObject {
    func receiveTaskData(taskData: TaskListDataStore)
    func receiveDeleted(task: Task)
}

final class TaskListInteractor: TaskListInteractorInputProtocol {
    private unowned let presenter: TaskListInteractorOutputProtocol
    
    init(presenter: any TaskListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func delete(task: Task) {
        StorageManager.shared.delete(task)
        presenter.receiveDeleted(task: task)
    }
    
    func provideTaskData() {
        if StorageManager.shared.isFirstLaunch() {
            fetchTaskDataFromApi()
        } else {
            fetchFromDataBase()
        }
    }
    
    private func fetchTaskDataFromApi() {
        NetworkManager.shared.fetchData { [unowned self] result in
            switch result {
            case .success(let taskList):
                let taskData = TaskListDataStore(tasks: taskList)
                StorageManager.shared.appWasLaunched()
                presenter.receiveTaskData(taskData: taskData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchFromDataBase() {
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
