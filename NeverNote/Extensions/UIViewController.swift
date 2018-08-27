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
    static let HOME_VIEW_CONTROLLER = "HomeViewController"
    static var home : HomeViewController {
        get {
            let homeStoryboard = UIStoryboard.home
            guard let homeViewController = homeStoryboard.instantiateViewController(withIdentifier: HomeViewController.HOME_VIEW_CONTROLLER) as? HomeViewController else {
                fatalError("There is no identifier set as \(HomeViewController.HOME_VIEW_CONTROLLER)")
            }
            return homeViewController
        }
    }
    
    static let ADD_SCREEN_VIEW_CONTROLLER = "AddScreenViewController"
    static var addScreen : AddScreenViewController {
        get {
            let addScreenStoryboard = UIStoryboard.addScreen
            guard let addScreenViewController = addScreenStoryboard.instantiateViewController(withIdentifier: AddScreenViewController.ADD_SCREEN_VIEW_CONTROLLER) as? AddScreenViewController else {
                fatalError("There is no identifier set as \(AddScreenViewController.ADD_SCREEN_VIEW_CONTROLLER)")
            }
            return addScreenViewController
        }
    }
    
    static let NOTES_VIEW_CONTROLLER = "NotesViewController"
    static var notes : NotesViewController {
        get {
            let notesStoryboard = UIStoryboard.notes
            guard let notesViewController = notesStoryboard.instantiateViewController(withIdentifier: NotesViewController.NOTES_VIEW_CONTROLLER) as? NotesViewController else {
                fatalError("There is no identifier set as \(NotesViewController.NOTES_VIEW_CONTROLLER)")
            }
            return notesViewController
        }
    }
    
    static let COMPLETED_TASKS_VIEW_CONTROLLER = "CompletedTasksViewController"
    static var completed : CompletedTasksViewController {
        get {
            let completedTasksStoryboard = UIStoryboard.completed
            guard let completedTasksViewController = completedTasksStoryboard.instantiateViewController(withIdentifier: CompletedTasksViewController.COMPLETED_TASKS_VIEW_CONTROLLER) as? CompletedTasksViewController else {
                fatalError("There is no identifier set as \(CompletedTasksViewController.COMPLETED_TASKS_VIEW_CONTROLLER)")
            }
            return completedTasksViewController
        }
    }
    
    static let TRASH_VIEW_CONTROLLER = "TrashViewController"
    static var trash: TrashViewController {
        get {
            let trashStoryboard = UIStoryboard.trash
            guard let trashViewController = trashStoryboard.instantiateViewController(withIdentifier: TrashViewController.TRASH_VIEW_CONTROLLER) as? TrashViewController else {
                fatalError("There is no identifier set as \(TrashViewController.TRASH_VIEW_CONTROLLER)")
            }
            return trashViewController
        }
    }
    
    static let SETTINGS_VIEW_CONTROLLER = "SettingsViewController"
    static var settings: SettingsViewController {
        get {
            let settingsStoryboard = UIStoryboard.settings
            guard let settingsViewController = settingsStoryboard.instantiateViewController(withIdentifier: SettingsViewController.SETTINGS_VIEW_CONTROLLER) as? SettingsViewController else {
                fatalError("There is no identifier set as \(SettingsViewController.SETTINGS_VIEW_CONTROLLER)")
            }
            return settingsViewController
        }
    }


}
