
import Foundation
import UIKit

class TrashViewController : UIViewController {
    @IBOutlet weak var trashTableView: UITableView!
    var deletedTasks = [String]()
    
    func setupTableView() {
        trashTableView.delegate = self
        trashTableView.dataSource = self
        trashTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    func addIntoTableView() {
        deletedTasks.append("Deleted Task 1")
        deletedTasks.append("Deleted Task 2")
        let indexPath = IndexPath(row: deletedTasks.count - 1, section: 0)
        self.trashTableView.insertRows(at: [indexPath], with: .top)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.TRASH
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        setupTableView()
        addIntoTableView()
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
        cell.textLabel?.text = deletedTasks[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
    }
}
