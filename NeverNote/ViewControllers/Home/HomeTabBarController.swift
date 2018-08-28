//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    let notes = UIViewController.notes
    let completed = UIViewController.completed
    let trash = UIViewController.trash
    let settings = UIViewController.settings
    
    let notesNavigationController = UIViewController.notesNavigationController
    let completedNavigationController = UIViewController.completedNavigationController
    let trashNavigationController = UIViewController.trashNavigationController
    let settingsNavigationController = UIViewController.settingsNavigationController
    
    let addScreen = UIViewController.addScreen
    
    override var selectedViewController: UIViewController? {
        didSet {
            print("VC \(selectedIndex)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupTabBar() {
        notesNavigationController.tabBarItem = UITabBarItem(title: Constants.NOTES, image: #imageLiteral(resourceName: "Notes").withRenderingMode(.alwaysTemplate), tag: 10)
        completedNavigationController.tabBarItem = UITabBarItem(title: Constants.COMPLETED, image: #imageLiteral(resourceName: "Done").withRenderingMode(.alwaysTemplate), tag: 12)
        trashNavigationController.tabBarItem = UITabBarItem(title: Constants.TRASH, image: #imageLiteral(resourceName: "Trash").withRenderingMode(.alwaysTemplate), tag: 14)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Constants.SETTINGS, image: #imageLiteral(resourceName: "Settings").withRenderingMode(.alwaysTemplate), tag: 16)
        self.viewControllers = [notesNavigationController, completedNavigationController, trashNavigationController, settingsNavigationController]
    }
    
}

