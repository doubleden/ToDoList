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
    func receiveTaskData(taskData: TaskData)
}

final class TaskListInteractor: TaskListInteractorInputProtocol {
    private unowned let presenter: TaskListInteractorOutputProtocol
    
    init(presenter: any TaskListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideTaskData() {
    }
}
