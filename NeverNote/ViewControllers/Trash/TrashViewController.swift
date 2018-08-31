
import Foundation
import UIKit

class TrashViewController : UIViewController {
    @IBOutlet private weak var trashTableView: UITableView!
    private var deletedTasks = [Task]()
    var indexPathArray = [IndexPath]()
    
    func setupTableView() {
        trashTableView.delegate = self
        trashTableView.dataSource = self
        trashTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    func addIntoTableView() {
        let indexPath = IndexPath(row: deletedTasks.count - 1, section: 0)
        self.trashTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = Constants.TRASH
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        addIntoTableView()
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
}
