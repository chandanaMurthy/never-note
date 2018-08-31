
import Foundation
import UIKit

class TrashViewController : UIViewController {
    @IBOutlet private weak var trashTableView: UITableView!
    weak var delegate: TrashViewControllerDelegate?
    private var deletedTasks = [Task]()
    var indexPathArray = [IndexPath]()
    
    private func setupTableView() {
        trashTableView.delegate = self
        trashTableView.dataSource = self
        trashTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = Constants.TRASH
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        print("loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        trashTableView.insertRows(at: indexPathArray, with: .top)
        indexPathArray.removeAll()
    }
    
    func append(task : Task) {
        self.deletedTasks.append(task)
        let indexPath = IndexPath(row: self.deletedTasks.count - 1, section: 0)
        self.indexPathArray.append(indexPath)
    }
}

extension TrashViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deletedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell : UITableViewCell, indexPath : IndexPath) {
        cell.textLabel?.text = deletedTasks[indexPath.row].taskTitle
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let undone = UIContextualAction(style: .normal, title: Constants.MARK_AS_UNDONE) { [weak self](ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            guard let weakSelf = self else {
                return
            }
            weakSelf.delegate?.trashViewController(trashViewController: weakSelf, didMarkUndone: weakSelf.deletedTasks[indexPath.row])
            self?.deletedTasks.remove(at: indexPath.row)
            self?.trashTableView.deleteRows(at: [indexPath], with: .fade)
            success(true)
        }
        return UISwipeActionsConfiguration(actions: [undone])
    }
}

protocol TrashViewControllerDelegate : class {
    func trashViewController(trashViewController: TrashViewController, didMarkUndone task: Task)
}

