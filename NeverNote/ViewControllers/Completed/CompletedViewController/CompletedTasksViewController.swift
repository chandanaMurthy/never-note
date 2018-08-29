
import Foundation
import UIKit

class CompletedTasksViewController: UIViewController {
    @IBOutlet weak var completedTasksTableView: UITableView!
    var completedTasks = [String]()
    
    
    func setupTableView() {
        completedTasksTableView.delegate = self
        completedTasksTableView.dataSource = self
        completedTasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.COMPLETED
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        completedTasks.append("Hello")
        completedTasks.append("Hello")
        completedTasks.append("Hello")
        let indexPath = IndexPath(row: completedTasks.count-1, section: 0)
        self.completedTasksTableView.insertRows(at: [indexPath], with: .top)
        setupTableView()
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
        cell.textLabel?.text = completedTasks[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
    }
    
}
