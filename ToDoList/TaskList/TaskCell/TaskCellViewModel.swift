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
    var buttonSystemNameImage: String { get }
    var taskName: String { get }
    init(task: Task)
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
        40
    }
    
    var buttonSystemNameImage: String {
        task.isDone ? "checkmark.seal.fill" : "checkmark.seal"
    }
    
    var taskName: String {
        task.name ?? ""
    }
    
    private let task: Task
    
    init(task: Task) {
        self.task = task
    }
}

final class TaskSectionViewModel: TaskSectionViewModelProtocol {
    var rows: [any TaskCellViewModelProtocol] = []
    var numberOfRows: Int {
        rows.count
    }
}
