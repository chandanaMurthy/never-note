//
//  TrashViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/25/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class TrashViewController : UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.title = Constants.TRASH
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
}
