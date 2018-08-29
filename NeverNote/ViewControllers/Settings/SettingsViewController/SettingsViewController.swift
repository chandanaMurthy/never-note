//
//  SettingsViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/25/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    let settingsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = Constants.SETTINGS
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
}

extension SettingsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell : UITableViewCell, indexPath : IndexPath) {
        cell.textLabel?.text = settingsList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
    }
}
