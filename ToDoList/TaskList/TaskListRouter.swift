//
//  TaskListRouter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskListRouterInputProtocol: AnyObject {
    init(view: TaskListViewController)
    func showTaskListDetailsViewController(with task: Task)
    func updateViewList()
}

final class TaskListRouter: TaskListRouterInputProtocol {
    
    private unowned let view: TaskListViewController
    
    init(view: TaskListViewController) {
        self.view = view
    }
    
    func showTaskListDetailsViewController(with task: Task) {
        view.performSegue(withIdentifier: "showDetails", sender: task)
    }
    
    func showAddTaskViewController() {
        view.performSegue(withIdentifier: "showAddView", sender: nil)
    }
    
    func updateViewList() {
        view.tableView.reloadData()
    }
}
