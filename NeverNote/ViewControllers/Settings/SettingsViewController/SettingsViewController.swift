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
    @IBAction func goHomeButton(_ sender: Any) {
        let homeViewController = UIViewController.home
        self.present(homeViewController, animated: true, completion: nil)
    }
    
}
