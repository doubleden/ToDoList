//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import UIKit

protocol AddTaskViewInputProtocol: AnyObject {
    func dismiss()
}

protocol AddTaskViewOutputProtocol {
    init(view: AddTaskViewInputProtocol, router: TaskListRouterOutputProtocol)
    func saveButtonPressed(taskName: String, taskDescription: String, taskDate: Date)
}

final class AddTaskViewController: UIViewController {

    @IBOutlet var taskNameTF: UITextField!
    @IBOutlet var taskDescriptionTF: UITextField!
    
    @IBOutlet var taskDateDP: UIDatePicker!
    
    var presenter: AddTaskViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonWasTapped() {
        presenter.saveButtonPressed(
            taskName: taskNameTF.text ?? "",
            taskDescription: taskDescriptionTF.text ?? "",
            taskDate: taskDateDP.date
        )
    }
}

// MARK: - AddTaskViewInputProtocol
extension AddTaskViewController: AddTaskViewInputProtocol {
    func dismiss() {
        self.navigationController?.popViewController(animated: true)
    }
}
