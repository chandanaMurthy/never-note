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
    private static let HOME_VIEW_CONTROLLER = "HomeViewController"
    static var home : UIStoryboard {
        get {
            return UIStoryboard(name: HOME_VIEW_CONTROLLER, bundle: nil)
        }
    }
    
    private static let ADD_SCREEN_VIEW_CONTROLLER = "AddScreenViewController"
    static var addScreen : UIStoryboard {
        get {
            return UIStoryboard(name: ADD_SCREEN_VIEW_CONTROLLER, bundle: nil)
        }
    }
    
    private static let NOTES_VIEW_CONTROLLER = "NotesViewController"
    static var notes : UIStoryboard {
        get {
            return UIStoryboard(name: NOTES_VIEW_CONTROLLER, bundle: nil)
        }
    }
    
    private static let COMPLETED_TASKS_VIEW_CONTROLLER = "CompletedTasksViewController"
    static var completed : UIStoryboard {
        get {
            return UIStoryboard(name: COMPLETED_TASKS_VIEW_CONTROLLER, bundle: nil)
        }
    }
    
    private static let TRASH_VIEW_CONTROLLER = "TrashViewController"
    static var trash : UIStoryboard {
        get {
            return UIStoryboard(name: TRASH_VIEW_CONTROLLER, bundle: nil)
        }
    }
    
    private static let SETTINGS_VIEW_CONTROLLER = "SettingsViewController"
    static var settings : UIStoryboard {
        get {
            return UIStoryboard(name: SETTINGS_VIEW_CONTROLLER, bundle: nil)
        }
    }
    
    private static let NOTES_NAVIGATION_CONTROLLER = "NotesNavigationController"
    static var notesNavigationController : UIStoryboard {
        get {
            return UIStoryboard(name: NOTES_NAVIGATION_CONTROLLER, bundle: nil)
        }
    }
}
