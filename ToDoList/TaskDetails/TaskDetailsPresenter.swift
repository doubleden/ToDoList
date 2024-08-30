//
//  TaskDetailsPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

struct TaskDetailsDataStore {
    let name: String
    let description: String?
    let date: Date?
    let isDone: Bool
}

final class TaskDetailsPresenter: TaskDetailsViewOutputProtocol {
    
    var interactor: TaskDetailsInteractorInputProtocol!
    private unowned let view: TaskDetailsViewInputProtocol
    private unowned let router: TaskListRouterOutputProtocol
    
    init(view: TaskDetailsViewInputProtocol, router: TaskListRouterOutputProtocol) {
        self.view = view
        self.router = router
    }
    
    func showDetails() {
        interactor.provideDetails()
    }
    
    func doneButtonWasPressed() {
        interactor.toggleIsDoneStatus()
    }
    
    func editTask(with name: String, _ description: String, _ date: Date) {
        interactor.editTask(with: name, description, date)
    }
}

// MARK: - TaskDetailsInteractorOutputProtocol
extension TaskDetailsPresenter: TaskDetailsInteractorOutputProtocol {
    func receiveChanged(task: Task) {
        view.displayTaskName(with: task.name)
        view.displayTaskDescription(description: task.descrip ?? "")
        view.displayTaskDate(with: formatDateToString(task.date), task.date ?? Date(timeIntervalSince1970: .zero))
        router.receiveNew(task: task)
    }
    
    func receiveUpdated(task: Task) {
        view.displayImageForButton(with: task.isDone)
        router.receiveNew(task: task)
    }
    
    func receiveTaskDetails(with dataStore: TaskDetailsDataStore) {
        view.displayTaskName(with: dataStore.name)
        view.displayTaskDescription(description: dataStore.description ?? "")
        view.displayTaskDate(with: formatDateToString(dataStore.date), dataStore.date ?? Date(timeIntervalSince1970: .zero))
        view.displayImageForButton(with: dataStore.isDone)
    }
    
    private func formatDateToString(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
