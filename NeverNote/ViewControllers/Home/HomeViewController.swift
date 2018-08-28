//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    let notes = UIViewController.notes
    let completed = UIViewController.completed
    let trash = UIViewController.trash
    let settings = UIViewController.settings
    
    @IBOutlet weak var trashButton: UITabBarItem!
    @IBOutlet weak var notesButton: UITabBarItem!
    @IBOutlet weak var settingsButton: UITabBarItem!
    @IBOutlet weak var completedButton: UITabBarItem!
    
    override var selectedViewController: UIViewController? {
        didSet {
            print("item at position \(selectedIndex) was selected")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addNavigationButton(_ sender: Any?) {
        let addScreenViewController = UIViewController.addScreen
        self.present(addScreenViewController, animated: true, completion: nil)
    }
    
    func setupTabBar() {
        notes.tabBarItem = UITabBarItem(title: Constants.NOTES, image: #imageLiteral(resourceName: "Notes"), tag: 10)
        completed.tabBarItem = UITabBarItem(title: Constants.COMPLETED, image: #imageLiteral(resourceName: "Done"), tag: 12)
        trash.tabBarItem = UITabBarItem(title: Constants.TRASH, image: #imageLiteral(resourceName: "Trash"), tag: 14)
        settings.tabBarItem = UITabBarItem(title: Constants.SETTINGS, image: #imageLiteral(resourceName: "Settings"), tag: 16)
        self.viewControllers = [notes, completed, trash, settings]
    }
    
}

