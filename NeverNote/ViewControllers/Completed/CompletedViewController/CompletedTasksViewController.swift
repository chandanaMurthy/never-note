
import Foundation
import UIKit

class CompletedTasksViewController: UIViewController {
    @IBOutlet weak var completedTasksTableView: UITableView!
    weak var delegate : CompletedTasksViewControllerDelegate?
    private var completedTasks = [Task]()
    private var completedTasksChanged = false
    private var indexPathArray = [IndexPath]()
    
    private func setupTableView() {
        completedTasksTableView.delegate = self
        completedTasksTableView.dataSource = self
        completedTasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    private func addToCompletedTableView() {
        completedTasks.append(Task(taskTitle: "Completed1", taskDetails: "Completed once"))
        completedTasks.append(Task(taskTitle: "Completed2", taskDetails: "Completed twice"))
        completedTasks.append(Task(taskTitle: "Completed3", taskDetails: "Completed once"))
        completedTasks.append(Task(taskTitle: "Completed4", taskDetails: "Completed once"))
        let indexPath = IndexPath(row: completedTasks.count - 1, section: 0)
        self.completedTasksTableView.insertRows(at: [indexPath], with: .top)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = Constants.COMPLETED
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        self.completedTasksTableView.reloadData()
        self.completedTasksChanged = false
        self.indexPathArray.removeAll()
        print("ViewDidLoad!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
        if self.completedTasksChanged {
            print("ViewWillAppear IF")
            self.completedTasksTableView.insertRows(at: indexPathArray, with: .automatic)
            self.completedTasksChanged = false
            self.indexPathArray.removeAll()
        }
        
    }
}

extension CompletedTasksViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell : UITableViewCell, indexPath : IndexPath) {
        cell.textLabel?.text = completedTasks[indexPath.row].taskTitle
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let undone = UIContextualAction(style: .normal, title: Constants.MARK_AS_UNDONE) { [weak self](ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            guard let weakSelf = self else {
                return
            }
            weakSelf.delegate?.completedTasksViewController(completedTaskViewController: weakSelf, didMarkUndone: weakSelf.completedTasks[indexPath.row])
            self?.completedTasks.remove(at: indexPath.row)
            self?.completedTasksTableView.deleteRows(at: [indexPath], with: .fade)
            success(true)
        }
        return UISwipeActionsConfiguration(actions: [undone])
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.completedTasksViewController(completedTaskViewController: self, didDelete: completedTasks[indexPath.row])
            completedTasks.remove(at: indexPath.row)
            self.completedTasksTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension CompletedTasksViewController {
    func insert(task: Task) {
        self.completedTasks.append(task)
        let indexPath = IndexPath(row: completedTasks.count - 1, section: 0)
        self.indexPathArray.append(indexPath)
        self.completedTasksChanged = true
    }
}

protocol CompletedTasksViewControllerDelegate : class {
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didDelete task: Task)
    
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didMarkUndone task: Task)
}

