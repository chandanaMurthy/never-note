
import Foundation
import UIKit

class CompletedTasksViewController: UIViewController {
    @IBOutlet weak var completedTasksTableView: UITableView!
    
    var completedTasks = [Task]()
    var completedTasksChanged = false
    var indexPathArray = [IndexPath]()
    
    
    func setupTableView() {
        completedTasksTableView.delegate = self
        completedTasksTableView.dataSource = self
        completedTasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    func addToCompletedTableView() {
        let indexPath = IndexPath(row: completedTasks.count - 1, section: 0)
        self.completedTasksTableView.insertRows(at: [indexPath], with: .top)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.COMPLETED
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        setupTableView()
        addToCompletedTableView()
        self.completedTasksTableView.reloadData()
        self.completedTasksChanged = false
        self.indexPathArray.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("ViewWillAppear")
        if self.completedTasksChanged {
            //print("ViewWillAppear IF")
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.completedTasksTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
