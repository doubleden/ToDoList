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
    private var dataStore: TaskListDataStore?
    
    init(view: any TaskListViewInputProtocol) {
        self.view = view
    }
    
    func didTapCell(at indexPath: IndexPath) {
        guard let task = dataStore?.tasks[indexPath.row] else { return }
        router.showTaskListDetailsViewController(with: task)
    }
}

// MARK: - TaskListInteractorOutputProtocol
extension TaskListPresenter: TaskListInteractorOutputProtocol {
    func receiveTaskData(taskData: TaskListDataStore) {
        self.dataStore = taskData
        let section = TaskSectionViewModel()
        dataStore?.tasks.forEach { section.rows.append(TaskCellViewModel(task: $0)) }
        view.reloadData(for section: section)
    }
}
