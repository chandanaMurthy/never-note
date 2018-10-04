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
    
    func setGlobalAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 10) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 10) as Any], for: .selected)
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
        let searchBarPlaceHolder = UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchBarPlaceHolder.font = UIFont(name: Constants.AVENIR_NEXT, size: 16)
        searchBarPlaceHolder.textColor = UIColor.white
        let searBarText = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searBarText.defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 16) as Any]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        assignDelegates()
        setGlobalAppearance()
    }
    
    private func setupTabBar() {
        notesNavigationController.tabBarItem = UITabBarItem(title: Constants.NOTES, image: #imageLiteral(resourceName: "Notes").withRenderingMode(.alwaysTemplate), tag: 0)
        completedNavigationController.tabBarItem = UITabBarItem(title: Constants.COMPLETED, image: #imageLiteral(resourceName: "Done").withRenderingMode(.alwaysTemplate), tag: 1)
        trashNavigationController.tabBarItem = UITabBarItem(title: Constants.TRASH, image: #imageLiteral(resourceName: "Trash").withRenderingMode(.alwaysTemplate), tag: 2)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Constants.SETTINGS, image: #imageLiteral(resourceName: "Settings").withRenderingMode(.alwaysTemplate), tag: 3)
        self.viewControllers = [notesNavigationController, completedNavigationController, trashNavigationController, settingsNavigationController]
    }
    
    private func assignDelegates() {
        notesNavigationController.notesNavDelegate = self
        completedNavigationController.completedDelegate = self
        trashNavigationController.trashDelegate = self
    }
}

extension HomeTabBarController: CompletedNavigationControllerDelegate {
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didDelete task: Task) {
        trashNavigationController.append(task: task)
    }
    
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didMarkUndone task: Task) {
        notesNavigationController.appendToNotes(task: task)
    }
}

extension HomeTabBarController: NotesNavigationControllerDelegate {
    func notesNavigationController(notesNavigationController: NotesNavigationController, didCompleteTask task: Task) {
        completedNavigationController.insert(task: task)
    }
    
    func notesNavigationController(notesNavigationController: NotesNavigationController, didDeleteTask task: Task) {
        trashNavigationController.insert(task: task)
    }
}

extension HomeTabBarController: TrashNavigationControllerDelegate {
    func trashNavigationController(trashNavigationController: TrashNavigationController, didMarkUndone task: Task) {
        notesNavigationController.appendToNotes(task: task)
    }
}
