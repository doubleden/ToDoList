//
//  TaskListRouter.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

protocol TaskListRouterInputProtocol {
    init(view: TaskListViewController, presenter: TaskListRouterOutputProtocol)
    func showTaskListDetailsViewController(with task: Task)
    func updateViewList(for task: Task)
}

protocol TaskListRouterOutputProtocol: AnyObject {
    func receiveNew(task: Task)
}

final class TaskListRouter: TaskListRouterInputProtocol {
    
    private unowned let view: TaskListViewController
    private unowned let presenter: TaskListRouterOutputProtocol
    
    init(view: TaskListViewController, presenter: TaskListRouterOutputProtocol) {
        self.view = view
        self.presenter = presenter
    }
    
    func showTaskListDetailsViewController(with task: Task) {
        view.performSegue(withIdentifier: "showDetails", sender: task)
    }
    
    func showAddTaskViewController() {
        view.performSegue(withIdentifier: "showAddView", sender: nil)
    }
    
    func updateViewList(for task: Task) {
        presenter.receiveNew(task: task)
    }
}
