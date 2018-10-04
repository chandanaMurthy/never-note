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
    private static let LOGIN_VIEW_CONTROLLER = "LoginViewController"
    static var login: LoginViewController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.login, identifier: LOGIN_VIEW_CONTROLLER, to: LoginViewController.self)
    }
    
    private static let REGISTER_VIEW_CONTROLLER = "RegisterViewController"
    static var register: RegisterViewController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.register, identifier: REGISTER_VIEW_CONTROLLER, to: RegisterViewController.self)
    }
    
    private static let HOME_TABBAR_CONTROLLER = "HomeTabBarController"
    static var home: HomeTabBarController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.home, identifier: HOME_TABBAR_CONTROLLER, to: HomeTabBarController.self)
    }
    
    static let ADD_SCREEN_VIEW_CONTROLLER = "AddScreenViewController"
    static var addScreen: AddScreenViewController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.addScreen, identifier: ADD_SCREEN_VIEW_CONTROLLER, to: AddScreenViewController.self)
    }
    
    static let NOTES_VIEW_CONTROLLER = "NotesViewController"
    static var notes: NotesViewController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.notes, identifier: NOTES_VIEW_CONTROLLER, to: NotesViewController.self)
    }
    
    static let COMPLETED_TASKS_VIEW_CONTROLLER = "CompletedTasksViewController"
    static var completed: CompletedTasksViewController {
       return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.completed, identifier: COMPLETED_TASKS_VIEW_CONTROLLER, to: CompletedTasksViewController.self)
    }
    
    static let TRASH_VIEW_CONTROLLER = "TrashViewController"
    static var trash: TrashViewController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.trash, identifier: TRASH_VIEW_CONTROLLER, to: TrashViewController.self)
    }

    static let SETTINGS_VIEW_CONTROLLER = "SettingsViewController"
    static var settings: SettingsViewController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.settings, identifier: SETTINGS_VIEW_CONTROLLER, to: SettingsViewController.self)
    }
    
    static let NOTES_NAVIGATION_CONTROLLER = "NotesNavigationController"
    static var notesNavigationController: NotesNavigationController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.notesNavigationController, identifier: NOTES_NAVIGATION_CONTROLLER, to: NotesNavigationController.self)
    }
    
    static let COMPLETED_NAVIGATION_CONTROLLER = "CompletedNavigationController"
    static var completedNavigationController: CompletedNavigationController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.completedNavigationController, identifier: COMPLETED_NAVIGATION_CONTROLLER, to: CompletedNavigationController.self)
    }
    
    static let SETTINGS_NAVIGATION_CONTROLLER = "SettingsNavigationController"
    static var settingsNavigationController: SettingsNavigationController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.settingsNavigationController, identifier: SETTINGS_NAVIGATION_CONTROLLER, to: SettingsNavigationController.self)
    }

    static let TRASH_NAVIGATION_CONTROLLER = "TrashNavigationController"
    static var trashNavigationController: TrashNavigationController {
        return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.trashNavigationController, identifier: TRASH_NAVIGATION_CONTROLLER, to: TrashNavigationController.self)
    }
    
    private static func instantiateFromStoryboard<T: UIViewController>(storyboard: UIStoryboard, identifier: String, to type: T.Type) -> T {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("There is no identifier set as \(identifier)")
        }
        return viewController
    }
}
