//
//  NotesNavigationController.swift
//  NeverNote
//
//  Created by Aditya on 8/27/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class NotesNavigationController: UINavigationController {
    private let notesViewController = UIViewController.notes
    weak var notesNavDelegate: NotesNavigationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [notesViewController]
        self.notesViewController.delegate = self
    }
    
    func appendToNotes(task: Task) {
        notesViewController.appendToNotes(task: task)
    }
}

extension NotesNavigationController: NotesViewControllerDelegate {
    func notesViewController(notesViewController: NotesViewController, didCompleteTask task: Task) {
        self.notesNavDelegate?.notesNavigationController(notesNavigationController: self, didCompleteTask: task)
    }
    
    func notesViewController(notesViewController: NotesViewController, didDeleteTask task: Task) {
        self.notesNavDelegate?.notesNavigationController(notesNavigationController: self, didDeleteTask: task)
    }
}

protocol NotesNavigationControllerDelegate: class {
    func notesNavigationController(notesNavigationController: NotesNavigationController, didCompleteTask task: Task)
    
    func notesNavigationController(notesNavigationController: NotesNavigationController, didDeleteTask task: Task)
}
