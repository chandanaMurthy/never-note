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
    let completedViewController = UIViewController.completed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [completedViewController]
    }
}
