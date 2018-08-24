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

}
