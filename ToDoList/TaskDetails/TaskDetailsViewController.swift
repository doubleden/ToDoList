//
//  TaskDetailsViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskDetailsViewInputProtocol: AnyObject {
    func displayTaskName(with name: String)
    func displayTaskDate(with date: String)
    func displayTaskDescription(description: String)
    func displayImageForButton(with status : Bool)
}

protocol TaskDetailsViewOutputProtocol {
    init(view: TaskDetailsViewInputProtocol, router: TaskListRouterInputProtocol)
    func showDetails()
    func doneButtonWasPressed()
}

class TaskDetailsViewController: UIViewController {

    @IBOutlet var nameTaskLabel: UILabel!
    @IBOutlet var dateTaskLabel: UILabel!
    @IBOutlet var descriptionTaskLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var presenter: TaskDetailsViewOutputProtocol!
    private let configurator = TaskDetailsConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func doneButtonDidTapped() {
        presenter.doneButtonWasPressed()
    }
}

extension TaskDetailsViewController: TaskDetailsViewInputProtocol {
    func displayTaskName(with name: String) {
        nameTaskLabel.text = name
    }
    
    func displayTaskDate(with date: String) {
        dateTaskLabel.text = date
    }
    
    func displayTaskDescription(description: String) {
        descriptionTaskLabel.text = description
    }
    
    func displayImageForButton(with status: Bool) {
        let systemName = status ? "checkmark.seal.fill" : "checkmark.seal"
        doneButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}
