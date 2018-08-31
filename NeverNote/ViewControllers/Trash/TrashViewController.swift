
import Foundation
import UIKit

class TrashViewController : UIViewController {
    @IBOutlet private weak var trashTableView: UITableView!
    private var deletedTasks = [Task]()
    var toInsertTasks = [Task]()
    
    var deletedTasksChanged = false
    
    func setupTableView() {
        trashTableView.delegate = self
        trashTableView.dataSource = self
        trashTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = Constants.TRASH
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        insertNewTasks(tasks: toInsertTasks)
        print("Trash ViewDidLoad!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.insertNewTasks(tasks: self.toInsertTasks)
       
    }
    
    func insertNewTasks(tasks : [Task]) {
        let indexPaths = generateIndexPaths(from: tasks)
        self.trashTableView.insertRows(at: indexPaths, with: .automatic)
        self.toInsertTasks.removeAll()
    }
    
    
    func generateIndexPaths(from : [Task]) -> [IndexPath] {
        return toInsertTasks.map { (task) -> IndexPath in
            self.deletedTasks.append(task)
            return IndexPath(row:self.deletedTasks.count - 1, section: 0)
        }
    }
    
    
    
    func append(task : Task) {
        self.toInsertTasks.append(task)
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
}

extension TrashViewController {
    func insert(task: Task) {
        self.toInsertTasks.append(task)
    }
}
