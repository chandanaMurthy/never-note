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
    private let completedViewController = UIViewController.completed
    weak var completedDelegate: CompletedNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [completedViewController]
        completedViewController.delegate = self
    }
}

extension CompletedNavigationController: CompletedTasksViewControllerDelegate {
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didDelete task: Task) {
        completedDelegate?.completedNavigationController(completedNavigationController: self, didDelete: task)
    }
    
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didMarkUndone task: Task) {
        completedDelegate?.completedNavigationController(completedNavigationController: self, didMarkUndone: task)
    }
}

extension CompletedNavigationController {
    func insert(task: Task) {
        completedViewController.insert(task: task)
    }
}

protocol CompletedNavigationControllerDelegate: class {
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didDelete task: Task)
    
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didMarkUndone task: Task)
}
