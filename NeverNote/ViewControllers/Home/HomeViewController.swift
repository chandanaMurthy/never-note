//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func addNavigationButton(_ sender: Any?) {
        
    }

    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let selectedPosition = self.tabBar.items?.index(of: item) else {
            return
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

