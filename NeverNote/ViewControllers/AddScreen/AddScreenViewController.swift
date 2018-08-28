//
//  AddScreenViewController.swift
//  NeverNote
//
//  Created by Aditya on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class AddScreenViewController: UIViewController {
    
    @IBOutlet weak var titletextField: UITextField!
    @IBOutlet weak var taskTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.ADD_SCREEN
        self.configureAddScreenNavBar()
    }
    
    func configureAddScreenNavBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(dismissAddScreen))
    }
    
    @objc func dismissAddScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
