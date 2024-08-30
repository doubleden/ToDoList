//
//  TaskDetailsViewController.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskDetailsViewInputProtocol: AnyObject {
    func displayTaskName(with name: String)
    func displayTaskDate(with date: String, _ dateForDP: Date)
    func displayTaskDescription(description: String)
    func displayImageForButton(with status : Bool)
}

protocol TaskDetailsViewOutputProtocol {
    init(view: TaskDetailsViewInputProtocol, router: TaskListRouterOutputProtocol)
    func showDetails()
    func doneButtonWasPressed()
    func editTask(with name: String, _ description: String, _ date: Date)
}

class TaskDetailsViewController: UIViewController {

    @IBOutlet var nameTaskLabel: UILabel!
    @IBOutlet var dateTaskLabel: UILabel!
    @IBOutlet var descriptionTaskLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    @IBOutlet var nameTaskTF: UITextField!
    @IBOutlet var dateTaskTF: UIDatePicker!
    @IBOutlet var descriptionTaskTF: UITextField!
    @IBOutlet var editButton: UIBarButtonItem!
    
    var presenter: TaskDetailsViewOutputProtocol!
    private let configurator = TaskDetailsConfigurator()
    private var isEditingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func doneButtonDidTapped() {
        presenter.doneButtonWasPressed()
    }
    
    @IBAction func editButtonDidTapped(_ sender: UIBarButtonItem) {
        if isEditingMode {
            presenter.editTask(
                with: nameTaskTF.text ?? "",
                descriptionTaskTF.text ?? "",
                dateTaskTF.date
            )
        }
        isEditingMode.toggle()
        editButton.title = isEditingMode ? "Done" : "Edit"
        toggleEditingMode(isEditing: isEditingMode)
    }
    
    private func toggleEditingMode(isEditing: Bool) {
        nameTaskLabel.isHidden = isEditing
        dateTaskLabel.isHidden = isEditing
        descriptionTaskLabel.isHidden = isEditing
        doneButton.isHidden = isEditing
        
        nameTaskTF.isHidden = !isEditing
        dateTaskTF.isHidden = !isEditing
        descriptionTaskTF.isHidden = !isEditing
        
        editButtonItem.title = isEditing ? "Edit" : "Done"
    }
}

extension TaskDetailsViewController: TaskDetailsViewInputProtocol {
    func displayTaskName(with name: String) {
        nameTaskLabel.text = name
        nameTaskTF.text = name
    }
    
    func displayTaskDate(with date: String, _ dateForDP: Date) {
        dateTaskLabel.text = date
        dateTaskTF.date = dateForDP
    }
    
    func displayTaskDescription(description: String) {
        descriptionTaskLabel.text = description
        descriptionTaskTF.text = description
    }
    
    func displayImageForButton(with status: Bool) {
        let systemName = status ? "checkmark.seal.fill" : "checkmark.seal"
        doneButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}
