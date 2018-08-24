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
}
