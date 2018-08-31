//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    private let notesNavigationController = UIViewController.notesNavigationController
    private let completedNavigationController = UIViewController.completedNavigationController
    private let trashNavigationController = UIViewController.trashNavigationController
    private let settingsNavigationController = UIViewController.settingsNavigationController
    
    private let addScreen = UIViewController.addScreen
    
    override var selectedViewController: UIViewController? {
        didSet {
            print("VC \(selectedIndex)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        assignDelegates()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func setupTabBar() {
        notesNavigationController.tabBarItem = UITabBarItem(title: Constants.NOTES, image: #imageLiteral(resourceName: "Notes").withRenderingMode(.alwaysTemplate), tag: 10)
        completedNavigationController.tabBarItem = UITabBarItem(title: Constants.COMPLETED, image: #imageLiteral(resourceName: "Done").withRenderingMode(.alwaysTemplate), tag: 12)
        trashNavigationController.tabBarItem = UITabBarItem(title: Constants.TRASH, image: #imageLiteral(resourceName: "Trash").withRenderingMode(.alwaysTemplate), tag: 14)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Constants.SETTINGS, image: #imageLiteral(resourceName: "Settings").withRenderingMode(.alwaysTemplate), tag: 16)
        
        self.viewControllers = [notesNavigationController, completedNavigationController, trashNavigationController, settingsNavigationController]
    }
    
    private func assignDelegates() {
        self.notesNavigationController.notesNavDelegate = self
    }
    
}

extension HomeTabBarController: NotesNavigationControllerDelegate {
    func notesNavigationController(notesNavigationController: NotesNavigationController, didCompleteTask task: Task) {
        completedNavigationController.insert(task: task)
    }
    
    func notesNavigationController(notesNavigationController: NotesNavigationController, didDeleteTask task: Task) {
        
    }
}

