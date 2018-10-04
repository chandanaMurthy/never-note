//
//  SettingsNavigationController.swift
//  NeverNote
//
//  Created by Chandana on 8/28/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class SettingsNavigationController: UINavigationController {
    let settingViewController = UIViewController.settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [settingViewController]
    }
}
