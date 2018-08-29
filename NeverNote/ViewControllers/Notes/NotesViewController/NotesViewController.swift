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
    let BACK_BUTTON_TITLE = "Back"
    let CELL_IDENTIFIER = "cellIdentifier"
    
    var taskData = [String]()
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationController?.navigationBar.backItem?.title = "Back"
    }
    
    @objc func didTapRightBarButton(_ sender: Any?) {
        //self.navigationController?.pushViewController(UIViewController.addScreen, animated: true)
        
        self.present(UIViewController.addScreen, animated: true, completion: nil)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = NAVIGATION_BAR_TITLE
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let rightNavBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(didTapRightBarButton))
        rightNavBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: BACK_BUTTON_TITLE, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
}

extension NotesViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesTableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        cell.textLabel?.text = taskData[indexPath.row]
        return cell
    }
    
    
}
