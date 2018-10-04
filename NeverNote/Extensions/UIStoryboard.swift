//
//  UIStoryboar.swift
//  NeverNote
//
//  Created by Aditya on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    private static let LOGIN_VIEW_CONTROLLER = "LoginViewController"
    static var login: UIStoryboard {
        return UIStoryboard(name: LOGIN_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let REGISTER_VIEW_CONTROLLER = "RegisterViewController"
    static var register: UIStoryboard {
        return UIStoryboard(name: REGISTER_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let HOME_TABBAR_CONTROLLER = "HomeTabBarController"
    static var home: UIStoryboard {
        return UIStoryboard(name: HOME_TABBAR_CONTROLLER, bundle: nil)
    }
    
    private static let ADD_SCREEN_VIEW_CONTROLLER = "AddScreenViewController"
    static var addScreen: UIStoryboard {
        return UIStoryboard(name: ADD_SCREEN_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let NOTES_VIEW_CONTROLLER = "NotesViewController"
    static var notes: UIStoryboard {
        return UIStoryboard(name: NOTES_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let COMPLETED_TASKS_VIEW_CONTROLLER = "CompletedTasksViewController"
    static var completed: UIStoryboard {
        return UIStoryboard(name: COMPLETED_TASKS_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let TRASH_VIEW_CONTROLLER = "TrashViewController"
    static var trash: UIStoryboard {
        return UIStoryboard(name: TRASH_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let SETTINGS_VIEW_CONTROLLER = "SettingsViewController"
    static var settings: UIStoryboard {
        return UIStoryboard(name: SETTINGS_VIEW_CONTROLLER, bundle: nil)
    }
    
    private static let NOTES_NAVIGATION_CONTROLLER = "NotesNavigationController"
    static var notesNavigationController: UIStoryboard {
        return UIStoryboard(name: NOTES_NAVIGATION_CONTROLLER, bundle: nil)
    }
    
    private static let TRASH_NAVIGATION_CONTROLLER = "TrashNavigationController"
    static var trashNavigationController: UIStoryboard {
        return UIStoryboard(name: TRASH_NAVIGATION_CONTROLLER, bundle: nil)
    }
    
    private static let COMPLETED_NAVIGATION_CONTROLLER = "CompletedNavigationController"
    static var completedNavigationController: UIStoryboard {
        return UIStoryboard(name: COMPLETED_NAVIGATION_CONTROLLER, bundle: nil)
    }
    
    private static let SETTINGS_NAVIGATION_CONTROLLER = "SettingsNavigationController"
    static var settingsNavigationController: UIStoryboard {
        return UIStoryboard(name: SETTINGS_NAVIGATION_CONTROLLER, bundle: nil)
    }
}
