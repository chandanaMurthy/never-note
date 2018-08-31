//
//  TrashNavigationController.swift
//  NeverNote
//
//  Created by Chandana on 8/28/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class TrashNavigationController : UINavigationController {
    private let trashViewController = UIViewController.trash
    private let notesViewController = UIViewController.notes
    weak var trashDelegate: TrashNavigationControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [trashViewController]
        trashViewController.delegate = self
    }
    
    func append(task : Task) {
        trashViewController.append(task: task)
    }
}

extension TrashNavigationController : TrashViewControllerDelegate {
    func trashViewController(trashViewController: TrashViewController, didMarkUndone task: Task) {
        notesViewController.appendToNotes(task: task)
        trashDelegate?.trashNavigationController(trashNavigationController: self, didMarkUndone: task)
    }
}

protocol TrashNavigationControllerDelegate : class {
    func trashNavigationController(trashNavigationController : TrashNavigationController, didMarkUndone task: Task)
}
