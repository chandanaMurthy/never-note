//
//  CompletedTasks.swift
//  NeverNote
//
//  Created by Aditya on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class CompletedTasksViewController: UIViewController {
    @IBAction func goHomeButton(_ sender: Any) {
        let homeViewController = UIViewController.home
        self.present(homeViewController, animated: true, completion: nil)
    }
}
