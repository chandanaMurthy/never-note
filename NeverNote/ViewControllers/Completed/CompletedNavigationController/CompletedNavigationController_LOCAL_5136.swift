//
//  CompletedNavigationController.swift
//  NeverNote
//
//  Created by Chandana on 8/28/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class CompletedNavigationController: UINavigationController {
    let completedViewController = UIViewController.completed
    let notesViewController = UIViewController.notes
    let trashViewController = UIViewController.trash
    weak var completedDelegate: CompletedNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [completedViewController]
        completedViewController.delegate = self
    }
}

extension CompletedNavigationController: CompletedTasksViewControllerDelegate {
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didDelete task: Task) {
        notesViewController.appendToNotes(task: task)
        completedDelegate?.completedNavigationController(completedNavigationController: self, didDelete: task)
    }
    
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didMarkUndone task: Task) {
        trashViewController.append(task: task)
        completedDelegate?.completedNavigationController(completedNavigationController: self, didMarkUndone: task)
    }
}

protocol CompletedNavigationControllerDelegate: class {
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didDelete task: Task)
    
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didMarkUndone task: Task)
}
