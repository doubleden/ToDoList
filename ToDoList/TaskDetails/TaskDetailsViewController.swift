//
//  TaskDetailsViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskDetailsViewInputProtocol: AnyObject {
    
}

protocol TaskDetailsViewOutputProtocol {
    init(view: TaskDetailsViewInputProtocol)
}

class TaskDetailsViewController: UIViewController {

    @IBOutlet var TaskDateLabel: UILabel!
    @IBOutlet var TaskDescriptionLabel: UILabel!
    
    var presenter: TaskDetailsViewOutputProtocol!
    private let configurator = TaskDetailsConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    @IBAction func DoneButtonDidTapped(_ sender: UIButton) {
    }
    
}

extension TaskDetailsViewController: TaskDetailsViewInputProtocol {
    
}
