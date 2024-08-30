//
//  AddTaskInteractor.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import Foundation

protocol AddTaskInteractorInputProtocol {
    init(presenter: AddTaskInteractorOutputProtocol)
    func saveTask(with name: String, _ description: String, _ date: Date)
}

protocol AddTaskInteractorOutputProtocol: AnyObject {
    
}

final class AddTaskInteractor: AddTaskInteractorInputProtocol {
    
    private unowned let presenter: AddTaskInteractorOutputProtocol
    
    init(presenter: AddTaskInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func saveTask(with name: String, _ description: String, _ date: Date) {
        
    }
}
