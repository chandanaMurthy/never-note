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
    private let completedViewController = UIViewController.completed
    private let notesViewController = UIViewController.notes
    private let trashViewController = UIViewController.trash
    weak var completedDelegate : CompletedNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [completedViewController]
        completedViewController.delegate = self
    }
}

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

extension CompletedNavigationController {
    //Inserts a task from Notes To Completed
    func insert(task: Task) {
        completedViewController.insert(task: task)
    }
}

protocol CompletedNavigationControllerDelegate : class {
    func completedNavigationController(completedNavigationController : CompletedNavigationController, didDelete task: Task)
    
    func completedNavigationController(completedNavigationController : CompletedNavigationController, didMarkUndone task: Task)
}

