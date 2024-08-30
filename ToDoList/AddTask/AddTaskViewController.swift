//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 30/8/24.
//

import UIKit

protocol AddTaskViewInputProtocol: AnyObject {
    
}

protocol AddTaskViewOutputProtocol {
    init(view: AddTaskViewInputProtocol, router: TaskListRouterInputProtocol)
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

extension AddTaskViewController: AddTaskViewInputProtocol {
    
}
