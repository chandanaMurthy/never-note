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
    private let BACK_BUTTON_TITLE = "Back"
    private let COMPLETED_ACTION_TITLE = "Mark Done"
    
    private var tasks = [Task]()
    weak var delegate: NotesViewControllerDelegate?
    private var notesIndexPathArray = [IndexPath]()
    
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
    
    private func configureNavigationBar() {
        self.navigationItem.title = Constants.NOTES
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let rightNavBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(didTapRightBarButton))
        rightNavBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: BACK_BUTTON_TITLE, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    func appendToNotes(task: Task) {
        self.tasks.append(task)
        let indexPath = IndexPath(row: self.tasks.count - 1, section: 0)
        notesIndexPathArray.append(indexPath)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notesTableView.insertRows(at: notesIndexPathArray, with: .automatic)
        notesIndexPathArray.removeAll()
    }
}

extension NotesViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesTableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].taskTitle
        return cell
    }
    
    private func setupTableView() {
        self.notesTableView.dataSource = self
        self.notesTableView.delegate = self
        self.notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
        
        tasks.append(Task(taskTitle: "A", taskDetails: "A"))
        tasks.append(Task(taskTitle: "B", taskDetails: "B"))
        tasks.append(Task(taskTitle: "C", taskDetails: "C"))
        tasks.append(Task(taskTitle: "D", taskDetails: "D"))
        tasks.append(Task(taskTitle: "E", taskDetails: "E"))
        tasks.append(Task(taskTitle: "F", taskDetails: "F"))
        tasks.append(Task(taskTitle: "G", taskDetails: "G"))
        tasks.append(Task(taskTitle: "H", taskDetails: "H"))
        
        self.notesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.notesViewController(notesViewController: self, didDeleteTask: tasks[indexPath.row])
            tasks.remove(at: indexPath.row)
            notesTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let completedAction = UIContextualAction(style: .normal, title: COMPLETED_ACTION_TITLE) { (action: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            self.delegate?.notesViewController(notesViewController: self, didCompleteTask: self.tasks[indexPath.row])
            self.tasks.remove(at: indexPath.row)
            self.notesTableView.deleteRows(at: [indexPath], with: .automatic)
            success(true)
        }
        return UISwipeActionsConfiguration(actions: [completedAction])
    }
}

extension NotesViewController : AddScreenViewControllerDelegate {
    func addScreenViewController(addScreenViewController: AddScreenViewController, didCreate task: Task) {
        self.tasks.append(task)
        self.notesTableView.reloadData()
    }
}

protocol NotesViewControllerDelegate: class {
    func notesViewController(notesViewController: NotesViewController, didCompleteTask task: Task)
    
    func notesViewController(notesViewController: NotesViewController, didDeleteTask task: Task)
}
