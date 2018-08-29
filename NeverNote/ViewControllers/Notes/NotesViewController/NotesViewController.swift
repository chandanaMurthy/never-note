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
    
    var tasks = [Task]()

    
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.setupTableView()
    }
    
    @objc func didTapRightBarButton(_ sender: Any?) {
        let addScreenViewController = UIViewController.addScreen
        addScreenViewController.delegate = self
        self.present(addScreenViewController, animated: true, completion: nil)
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
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = notesTableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].taskTitle
        return cell
    }
    
    func setupTableView() {
        self.notesTableView.dataSource = self
        self.notesTableView.delegate = self
        self.notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_IDENTIFIER)
        self.notesTableView.reloadData()
    }
    
}

extension NotesViewController : AddScreenViewControllerDelegate {
    func addScreenViewController(addScreenViewController: AddScreenViewController, didCreate task: Task) {
        self.tasks.append(task)
    }

}
