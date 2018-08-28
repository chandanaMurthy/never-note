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
    
    override func viewDidLoad() {
        self.navigationItem.title = Constants.COMPLETED
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
}
