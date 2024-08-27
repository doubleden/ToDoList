//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

struct TaskListDataStore {
    let tasks: [Task]
}

final class TaskListPresenter: TaskListViewOutputProtocol {
    
    var interactor: TaskListInteractorInputProtocol!
    var router: TaskListRouterInputProtocol!
    private unowned let view: TaskListViewInputProtocol
    
    init(view: any TaskListViewInputProtocol) {
        self.view = view
    }
}

// MARK: - TaskListInteractorOutputProtocol
extension TaskListPresenter: TaskListInteractorOutputProtocol {
    
    func receiveTaskData(taskData: TaskListDataStore) {
        
    }
}
