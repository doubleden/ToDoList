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
    func didTapCell(at indexPath: IndexPath)
}

class TaskListViewController: UIViewController {
    
    var presenter: TaskListViewOutputProtocol!
    private let configurator = TaskListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? TaskDetailsViewController else {
            return
        }
        guard let task = sender as? Task else { return }
        
        let configurator: TaskDetailsConfiguratorProtocol = TaskDetailsConfigurator()
        configurator.configure(with: detailsVC, and: task)
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
