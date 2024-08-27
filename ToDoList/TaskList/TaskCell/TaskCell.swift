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
    var viewModel: TaskCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? TaskCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.taskName
        content.image = UIImage(systemName: viewModel.buttonSystemNameImage)
        contentConfiguration = content
    }
}
