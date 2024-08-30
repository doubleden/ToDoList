//
//  AddTaskInteractor.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import Foundation

protocol AddTaskInteractorInputProtocol {
    init(presenter: AddTaskInteractorOutputProtocol)
    func saveTask(data: AddTaskDataStore)
}

protocol AddTaskInteractorOutputProtocol: AnyObject {
    func wasSave(task: Task)
}

final class AddTaskInteractor: AddTaskInteractorInputProtocol {
    
    private unowned let presenter: AddTaskInteractorOutputProtocol
    
    init(presenter: AddTaskInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func saveTask(data: AddTaskDataStore) {
        let newTask = StorageManager.shared.saveTask(with: data.name, data.description, data.date)
        presenter.wasSave(task: newTask)
    }
}
