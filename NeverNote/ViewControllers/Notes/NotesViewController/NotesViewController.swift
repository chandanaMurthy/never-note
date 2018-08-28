//
//  TaskViewController.swift
//  NeverNote
//
//  Created by Aditya on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class NotesViewController: UIViewController {
    let NAVIGATION_BAR_TITLE = "Notes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationController?.navigationBar.backItem?.title = "Back"
    }
    
    @objc func didTapRightBarButton(_ sender: Any?) {
        self.navigationController?.pushViewController(UIViewController.addScreen, animated: true)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = NAVIGATION_BAR_TITLE
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let rightNavBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(didTapRightBarButton))
        rightNavBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
}
