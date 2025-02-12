//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskListViewInputProtocol: AnyObject {
    func reloadData(for section: TaskSectionViewModel)
    func deleteRow(at indexPath: IndexPath)
}

protocol TaskListViewOutputProtocol {
    var router: TaskListRouterInputProtocol! { get }
    init(view: TaskListViewInputProtocol)
    func didTapCell(at indexPath: IndexPath)
    func viewDidLoad()
    func didSwipeCell(at row: Int)
}

final class TaskListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var presenter: TaskListViewOutputProtocol!
    
    private let configurator = TaskListConfigurator()
    private var sectionViewModel: TaskSectionViewModelProtocol = TaskSectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let router = presenter as? TaskListRouterOutputProtocol else { return }
        
        if let detailsVC = segue.destination as? TaskDetailsViewController {
            guard let task = sender as? Task else { return }
            let configurator: TaskDetailsConfiguratorProtocol = TaskDetailsConfigurator()
            configurator.configure(with: detailsVC, and: task, router)
        } else {
            guard let addTaskVC = segue.destination as? AddTaskViewController else { return }
            let configurator: AddTaskConfiguratorProtocol = AddTaskConfigurator()
            configurator.configure(with: addTaskVC, and: router)
        }
    }
}

// MARK: - UITableViewDataSource
extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellID, for: indexPath)
        guard let cell = cell as? TaskCell else { return UITableViewCell() }
        cell.viewModel = cellViewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete"
        ) { [unowned self] _, _, _ in
            presenter.didSwipeCell(at: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sectionViewModel.rows[indexPath.row].cellHeight
    }
}

// MARK: - TaskListViewInputProtocol
extension TaskListViewController: TaskListViewInputProtocol {
    func deleteRow(at indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func reloadData(for section: TaskSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
    }
}
