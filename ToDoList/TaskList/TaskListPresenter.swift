//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

struct TaskListDataStore {
    var tasks: [Task]
}

final class TaskListPresenter: TaskListViewOutputProtocol {
    
    var interactor: TaskListInteractorInputProtocol!
    var router: TaskListRouterInputProtocol!
    
    private unowned let view: TaskListViewInputProtocol
    private var dataStore: TaskListDataStore?
    private let section = TaskSectionViewModel()
    
    init(view: any TaskListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.provideTaskData()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        guard let task = dataStore?.tasks[indexPath.row] else { return }
        router.showTaskListDetailsViewController(with: task)
    }
    
    func didSwipeCell(at index: Int) {
        guard let task = dataStore?.tasks[index] else { return }
        interactor.delete(task: task)
    }
}

// MARK: - TaskListInteractorOutputProtocol
extension TaskListPresenter: TaskListInteractorOutputProtocol {
    func receiveDeleted(task: Task) {
        guard let index = dataStore?.tasks.firstIndex(of: task) else { return }
        dataStore?.tasks.remove(at: index)
        section.rows.remove(at: index)
        let indexPath = IndexPath(row: index, section: 0)
        view.deleteRow(at: indexPath)
    }
    
    func receiveTaskData(taskData: TaskListDataStore) {
        self.dataStore = taskData
        dataStore?.tasks.forEach { section.rows.append(TaskCellViewModel(task: $0)) }
        view.reloadData(for: section)
    }
}
