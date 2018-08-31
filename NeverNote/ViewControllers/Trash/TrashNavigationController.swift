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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [trashViewController]
    }
    
    func append(task : Task) {
        trashViewController.append(task: task)
    }
}

extension TrashNavigationController {
    //Insert a task from Notes to Trash
    func insert(task: Task) {
        self.trashViewController.insert(task: task)
    }
}
