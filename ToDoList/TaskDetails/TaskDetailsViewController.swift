//
//  TaskDetailsViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskDetailsViewInputProtocol: AnyObject {
    func displayTaskDate(with date: String)
    func displayTaskDescription(description: String)
    func displayImageForButton(with systemName: String)
}

protocol TaskDetailsViewOutputProtocol {
    init(view: TaskDetailsViewInputProtocol)
}

class TaskDetailsViewController: UIViewController {

    @IBOutlet var dateTaskLabel: UILabel!
    @IBOutlet var descriptionTaskLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var presenter: TaskDetailsViewOutputProtocol!
    private let configurator = TaskDetailsConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonDidTapped(_ sender: UIButton) {
    }
}

extension TaskDetailsViewController: TaskDetailsViewInputProtocol {
    func displayTaskDate(with date: String) {
        dateTaskLabel.text = date
    }
    
    func displayTaskDescription(description: String) {
        descriptionTaskLabel.text = description
    }
    
    func displayImageForButton(with systemName: String) {
        doneButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}
