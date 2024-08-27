//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskListViewInputProtocol: AnyObject {
    func reloadData(for: String)
}

protocol TaskListViewOutputProtocol {
    init(view: TaskListViewInputProtocol)
}

class TaskListViewController: UIViewController {
    
    var presenter: TaskListViewOutputProtocol!
    private let configurator = TaskListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }

}

// MARK: - UITableViewDataSource
extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension TaskCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

// MARK: - TaskListViewInputProtocol
extension TaskListViewController: TaskListViewInputProtocol {
    func reloadData(for: String) {
        
    }
}
