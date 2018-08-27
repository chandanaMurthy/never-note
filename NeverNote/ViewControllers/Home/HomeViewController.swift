//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITabBarDelegate {

    @IBAction func addNavigationButton(_ sender: Any?) {
        let addScreenViewController = UIViewController.addScreen
        self.present(addScreenViewController, animated: true, completion: nil)
    }
    @IBOutlet weak var goToNotesButton: UITabBarItem!
    @IBOutlet weak var homeTabBar: UITabBar!
    @IBOutlet weak var goToCompletedButton: UITabBarItem!
    @IBOutlet weak var goToTrashButton: UITabBarItem!
    @IBOutlet weak var goToSettingsButton: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTabBar.delegate = self
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            let notesViewController = UIViewController.notes
            self.present(notesViewController, animated: true, completion: nil)
        }
        else if item.tag == 1 {
            let completedTasksViewController = UIViewController.completed
            self.present(completedTasksViewController, animated: true, completion: nil)
        }
        else if item.tag == 2 {
            print("trash")
        }
        else {
            print("settings")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

