//
//  CompletedNavigationController.swift
//  NeverNote
//
//  Created by Chandana on 8/28/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class CompletedNavigationController : UINavigationController {
<<<<<<< HEAD
    let completedViewController = UIViewController.completed
    let notesViewController = UIViewController.notes
    let trashViewController = UIViewController.trash
    weak var completedDelegate : CompletedNavigationControllerDelegate?
=======
    private let completedViewController = UIViewController.completed

>>>>>>> 94509e4bef9724254e9f93266269bb1379f8cf3e
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [completedViewController]
        completedViewController.delegate = self
    }
}

<<<<<<< HEAD
extension CompletedNavigationController : CompletedTasksViewControllerDelegate {
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didDelete task: Task) {
        notesViewController.appendToNotes(task: task)
        completedDelegate?.completedNavigationController(completedNavigationController: self, didDelete: task)
    }
    
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didMarkUndone task: Task) {
        trashViewController.append(task: task)
        completedDelegate?.completedNavigationController(completedNavigationController: self, didMarkUndone: task)
    }
}

protocol CompletedNavigationControllerDelegate : class {
    func completedNavigationController(completedNavigationController : CompletedNavigationController, didDelete task: Task)
    
    func completedNavigationController(completedNavigationController : CompletedNavigationController, didMarkUndone task: Task)
}
=======
extension CompletedNavigationController {
    func insert(task: Task) {
        completedViewController.insert(task: task)
    }
}

>>>>>>> 94509e4bef9724254e9f93266269bb1379f8cf3e
