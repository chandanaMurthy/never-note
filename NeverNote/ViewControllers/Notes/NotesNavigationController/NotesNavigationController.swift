//
//  NotesNavigationController.swift
//  NeverNote
//
//  Created by Aditya on 8/27/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class NotesNavigationController: UINavigationController {
    let notesViewController = UIViewController.notes
    let addScreenViewController = UIViewController.addScreen

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [notesViewController]
        // Do any additional setup after loading the view.
    }
    
    func appendToNotes(task: Task){
        notesViewController.appendToNotes(task: task)
    }
    
}
