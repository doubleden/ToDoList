//
//  TaskDetailsInteractor.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskDetailsInteractorInputProtocol {
    init(presenter: TaskDetailsInteractorOutputProtocol, task: Task)
}

protocol TaskDetailsInteractorOutputProtocol: AnyObject {
    
}

final class TaskDetailsInteractor: TaskDetailsInteractorInputProtocol {
    
    private unowned let presenter: TaskDetailsInteractorOutputProtocol
    private let task: Task
    
    init(presenter: TaskDetailsInteractorOutputProtocol, task: Task) {
        self.presenter = presenter
        self.task = task
    }
}
