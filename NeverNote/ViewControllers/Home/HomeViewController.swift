//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    let notes = NotesViewController()
    let completed = CompletedTasksViewController()
    let trash = TrashViewController()
    let settings = SettingsViewController()
    
    @IBOutlet weak var trashButton: UITabBarItem!
    @IBOutlet weak var notesButton: UITabBarItem!
    @IBOutlet weak var settingsButton: UITabBarItem!
    @IBOutlet weak var completedButton: UITabBarItem!
    
    @IBAction func addNavigationButton(_ sender: Any?) {
        let addScreenViewController = UIViewController.addScreen
        self.present(addScreenViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes.tabBarItem = UITabBarItem(title: Constants.NOTES, image: #imageLiteral(resourceName: "Notes"), tag: 10)
        
        completed.tabBarItem = UITabBarItem(title: Constants.COMPLETED, image: #imageLiteral(resourceName: "Done"), tag: 12)
        trash.tabBarItem = UITabBarItem(title: Constants.TRASH, image: #imageLiteral(resourceName: "Trash"), tag: 14)
        settings.tabBarItem = UITabBarItem(title: Constants.SETTINGS, image: #imageLiteral(resourceName: "Settings"), tag: 16)
        self.viewControllers = [notes, completed, trash, settings]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = 3
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //print(selectedIndex)
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            print("VC \(selectedIndex)")
        }
    }
    
    override var selectedIndex: Int {
        didSet {
            print(selectedIndex)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

