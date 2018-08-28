//
//  UIViewController.swift
//  NeverNote
//
//  Created by Aditya on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    private static let HOME_VIEW_CONTROLLER = "HomeViewController"
    static var home : HomeTabBarController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.home, identifier: HOME_VIEW_CONTROLLER, to: HomeTabBarController.self)
        }
    }
    
    static let ADD_SCREEN_VIEW_CONTROLLER = "AddScreenViewController"
    static var addScreen : AddScreenViewController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.addScreen, identifier: ADD_SCREEN_VIEW_CONTROLLER, to: AddScreenViewController.self)
        }
    }
    
    static let NOTES_VIEW_CONTROLLER = "NotesViewController"
    static var notes : NotesViewController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.notes, identifier: NOTES_VIEW_CONTROLLER, to: NotesViewController.self)
        }
    }
    
    static let COMPLETED_TASKS_VIEW_CONTROLLER = "CompletedTasksViewController"
    static var completed : CompletedTasksViewController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.completed, identifier: COMPLETED_TASKS_VIEW_CONTROLLER, to: CompletedTasksViewController.self)
        }
    }
    
    static let TRASH_VIEW_CONTROLLER = "TrashViewController"
    static var trash: TrashViewController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.trash, identifier: TRASH_VIEW_CONTROLLER, to: TrashViewController.self)
        }
    }

    static let SETTINGS_VIEW_CONTROLLER = "SettingsViewController"
    static var settings: SettingsViewController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.settings, identifier: SETTINGS_VIEW_CONTROLLER, to: SettingsViewController.self)
        }
    }
    
    static let NOTES_NAVIGATION_CONTROLLER = "NotesNavigationController"
    static var notesNavigationController: NotesNavigationController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.notesNavigationController, identifier: NOTES_NAVIGATION_CONTROLLER, to: NotesNavigationController.self)
        }
    }
    
    private static func instantiateFromStoryboard<T:UIViewController>(storyboard : UIStoryboard, identifier : String, to type : T.Type) -> T {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("There is no identifier set as \(identifier)")
        }
        return viewController
    }
}
