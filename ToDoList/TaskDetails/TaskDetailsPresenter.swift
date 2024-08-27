//
//  TaskDetailsPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

struct TaskDetailsData {
    let name: String
    let date: Date
    let description: String
    let isDone: Bool
}

final class TaskDetailsPresenter: TaskDetailsViewOutputProtocol {
    
    var interactor: TaskDetailsInteractorInputProtocol!
    unowned private let view: TaskDetailsViewInputProtocol
    
    init(view: any TaskDetailsViewInputProtocol) {
        self.view = view
    }
}

// MARK: - TaskDetailsInteractorOutputProtocol
extension TaskDetailsPresenter: TaskDetailsInteractorOutputProtocol {
    
}
