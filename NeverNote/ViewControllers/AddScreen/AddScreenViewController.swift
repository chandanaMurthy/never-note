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
    
    @IBAction func doneBarButton(_ sender: Any) {
        let homeViewController = UIViewController.home
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titletextField.placeholder = Constants.PLACEHOLDER_TEXTFIELD
    }
}
