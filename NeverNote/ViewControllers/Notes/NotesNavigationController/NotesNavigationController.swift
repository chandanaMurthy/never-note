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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NotesNavigationController : NotesViewControllerDelegate {
    func notesViewController(notesViewController: NotesViewController, didCompleteTask task: Task) {
        self.notesNavDelegate?.notesNavigationController(notesNavigationController: self, didCompleteTask: task)
    }
    
    func notesViewController(notesViewController: NotesViewController, didDeleteTask task: Task) {
        self.notesNavDelegate?.notesNavigationController(notesNavigationController: self, didDeleteTask: task)
    }
}

protocol NotesNavigationControllerDelegate : class {
    func notesNavigationController(notesNavigationController: NotesNavigationController, didCompleteTask task: Task)
    
    func notesNavigationController(notesNavigationController: NotesNavigationController, didDeleteTask task: Task)
}
