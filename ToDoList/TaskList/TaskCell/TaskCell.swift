//
//  TaskCell.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import UIKit

protocol TaskCellRepresentable {
    var viewModel: TaskCellViewModelProtocol? { get }
}

final class TaskCell: UITableViewCell, TaskCellRepresentable {
    @IBOutlet var button: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    var viewModel: TaskCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    @IBAction func buttonDidTapped() {
        guard let viewModel = viewModel as? TaskCellViewModel else { return }
        viewModel.buttonDidTapped()
        updateView()
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? TaskCellViewModel else { return }
        titleLabel.text = viewModel.taskName
        let systemName = viewModel.taskIsDone ? "checkmark.seal.fill" : "checkmark.seal"
        button.setImage(UIImage(systemName: systemName), for: .normal)
    }
}
