//
//  TaskCellViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskCellViewModelProtocol {
    var cellID: String { get }
    var cellHeight: Double { get }
    var taskIsDone: Bool { get }
    var taskName: String { get }
    init(task: Task)
    func buttonDidTapped()
}

protocol TaskSectionViewModelProtocol {
    var rows: [TaskCellViewModelProtocol] { get }
    var numberOfRows: Int { get }
}

final class TaskCellViewModel: TaskCellViewModelProtocol {
    var cellID: String {
        "cell"
    }
    
    var cellHeight: Double {
        60
    }
    
    var taskIsDone: Bool {
        task.isDone
    }
    
    var taskName: String {
        task.name
    }
    
    private let task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    func buttonDidTapped() {
        StorageManager.shared.toggleTaskIsDone(task: task)
    }
}

final class TaskSectionViewModel: TaskSectionViewModelProtocol {
    var rows: [any TaskCellViewModelProtocol] = []
    var numberOfRows: Int {
        rows.count
    }
}
