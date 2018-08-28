//
//  SettingsViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/25/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController {
    override func viewDidLoad() {
        self.navigationItem.title = Constants.SETTINGS
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
}
