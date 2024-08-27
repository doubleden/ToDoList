//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

struct TaskData {
    let name: String
    let isDone: Bool
}

final class TaskListPresenter: TaskListViewOutputProtocol {
    
    var interactor: TaskListInteractorInputProtocol!
    unowned private let view: TaskListViewInputProtocol
    
    init(view: any TaskListViewInputProtocol) {
        self.view = view
    }
}

// MARK: - TaskListInteractorOutputProtocol
extension TaskListPresenter: TaskListInteractorOutputProtocol {
    
    func receiveTaskData(taskData: TaskData) {
    }
}
