//
//  TaskDetailsInteractor.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskDetailsInteractorInputProtocol {
    init(presenter: TaskDetailsInteractorOutputProtocol)
}

protocol TaskDetailsInteractorOutputProtocol: AnyObject {
    
}

final class TaskDetailsInteractor: TaskDetailsInteractorInputProtocol {
    
    private unowned let presenter: TaskDetailsInteractorOutputProtocol
    
    init(presenter: TaskDetailsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
