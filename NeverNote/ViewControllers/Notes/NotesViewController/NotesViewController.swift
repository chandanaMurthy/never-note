import Foundation
import UIKit

class NotesViewController: UIViewController {
    private let notesViewModel = NotesViewModel()
    weak var delegate: NotesViewControllerDelegate?
    @IBOutlet weak var notesTableView: UITableView!
    private var noDataLabel: UILabel!
    private let searchController = UISearchController(searchResultsController: nil)
    
    private func createUILabel() {
        noDataLabel = UILabel(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height))
        noDataLabel.text = Constants.NO_DATA
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = .center
        noDataLabel.font = UIFont(name: Constants.AVENIR_NEXT, size: 20.0)
        noDataLabel.backgroundColor = UIColor.white
        self.view.addSubview(noDataLabel)
    }
    
    func integrateSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.SEARCHBAR_PLACEHOLDER
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        extendedLayoutIncludesOpaqueBars = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        notesViewModel.delegate = self
        integrateSearchBar()
        createUILabel()
        configureNavigationBar()
        setupTableView()
    }
    
    @objc func didTapRightBarButton(_ sender: Any?) {
        let addScreenViewController = UIViewController.addScreen
        addScreenViewController.delegate = self
        self.present(addScreenViewController, animated: true, completion: nil)
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = Constants.NOTES
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 19)]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes as [NSAttributedString.Key: Any]
        let rightNavBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(didTapRightBarButton))
        let leftNavBarButton = UIBarButtonItem(image: UIImage(named: notesViewModel.LOGOUT)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapLogOutButton))
        rightNavBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
    func loadLoginScreen() {
        let loginViewController = UIViewController.login
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title: notesViewModel.LOGOUT, message: notesViewModel.LOGOUT_MESSAGE, preferredStyle: .alert)
        let okAction = UIAlertAction(title: notesViewModel.CONFIRM, style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.loadLoginScreen()
        }
        let cancelAction = UIAlertAction(title: notesViewModel.CANCEL, style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Cancel Pressed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func didTapLogOutButton() {
        showAlertController()
    }
    
    func appendToNotes(task: Task) {
        notesViewModel.addToTasks(task: task)
        let indexPath = IndexPath(row: notesViewModel.getTasksCount() - 1, section: 0)
        notesViewModel.addToNotesIndexpathArray(indexPath: indexPath)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notesTableView.insertRows(at: notesViewModel.getIndexPathArray(), with: .top)
        notesViewModel.clearIndexPathArray()
    }
}

extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return notesViewModel.getFilteredDataCount()
        }
        return notesViewModel.getTasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesTableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        cell.textLabel?.font = UIFont(name: Constants.AVENIR_NEXT, size: 18)
        if isFiltering() {
            cell.textLabel?.text = notesViewModel.getFilteredDataName(at: indexPath.row).taskTitle
        } else {
            cell.textLabel?.text = notesViewModel.getTaskName(at: indexPath.row).taskTitle
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    private func createTestTasks() {
        notesViewModel.addToTasks(task: Task(taskTitle: "Ana", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "Banana", taskDetails: "B"))
        notesViewModel.addToTasks(task: Task(taskTitle: "San Jose", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "San Diego", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "San Francisco", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "India", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "Indiana", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "Ana2", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "Banana2", taskDetails: "B"))
        notesViewModel.addToTasks(task: Task(taskTitle: "San Jose2", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "San Diego2", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "San Francisco2", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "India2", taskDetails: "A"))
        notesViewModel.addToTasks(task: Task(taskTitle: "Indiana2", taskDetails: "A"))
    }
    
    private func setupTableView() {
        notesTableView.dataSource = self
        notesTableView.delegate = self
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
        createTestTasks()
        notesTableView.reloadData()
    }
    
    func removeTaskWhileFiltering(at indexPath: IndexPath) {
        notesViewModel.removeFromFilteredData(at: indexPath.row)
        notesViewModel.removeFromTasks(at: notesViewModel.getIndex(at: indexPath.row))
        notesViewModel.removeFromIndexArray(at: indexPath.row)
        notesTableView.deleteRows(at: [indexPath], with: .fade)
        notesTableView.reloadData()
    }
    
    func removeTaskWhileNotFiltering(at indexPath: IndexPath) {
        notesViewModel.removeFromTasks(at: indexPath.row)
        notesTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if isFiltering() {
                updateSearchResults(for: searchController)
                delegate?.notesViewController(notesViewController: self, didDeleteTask: notesViewModel.getTaskName(at: notesViewModel.getIndex(at: indexPath.row)))
                removeTaskWhileFiltering(at: indexPath)
            } else {
                delegate?.notesViewController(notesViewController: self, didDeleteTask: notesViewModel.getTaskName(at: indexPath.row))
                removeTaskWhileNotFiltering(at: indexPath)
            }
            notesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completedAction = UIContextualAction(style: .normal, title: Constants.COMPLETED_ACTION_TITLE) { (_: UIContextualAction, _: UIView, success: (Bool) -> Void) in
            if self.isFiltering() {
                self.updateSearchResults(for: self.searchController)
                self.delegate?.notesViewController(notesViewController: self, didCompleteTask: self.notesViewModel.getTaskName(at: self.notesViewModel.getIndex(at: indexPath.row)))
                self.removeTaskWhileFiltering(at: indexPath)
            } else {
                self.delegate?.notesViewController(notesViewController: self, didCompleteTask: self.notesViewModel.getTaskName(at: indexPath.row))
                self.removeTaskWhileNotFiltering(at: indexPath)
            }
            success(true)
        }
        return UISwipeActionsConfiguration(actions: [completedAction])
    }
}

extension NotesViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? false
    }
    
    func filterContentForSearchText(_ searchText: String) {
        for index in 0..<notesViewModel.getTasksCount() {
            if notesViewModel.getTaskName(at: index).taskTitle.lowercased().contains(searchText.lowercased()) {
                notesViewModel.addToFilteredData(task: notesViewModel.getTaskName(at: index))
                notesViewModel.addToIndexArray(index: index)
            }
        }
        notesTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        notesViewModel.clearIndexArray()
        notesViewModel.clearFilteredData()
        filterContentForSearchText(searchText)
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension NotesViewController: AddScreenViewControllerDelegate {
    func addScreenViewController(addScreenViewController: AddScreenViewController, didCreate task: Task) {
        notesViewModel.addToTasks(task: task)
        notesTableView.reloadData()
    }
}

extension NotesViewController: NotesViewModelDelegate {
    func hideNotesTableView(in notesViewModel: NotesViewModel) {
        notesTableView.isHidden = true
        noDataLabel.isHidden = false
    }
    
    func showNotesTableView(in notesViewModel: NotesViewModel) {
        noDataLabel.isHidden = true
        notesTableView.isHidden = false
    }
}

protocol NotesViewControllerDelegate: class {
    func notesViewController(notesViewController: NotesViewController, didCompleteTask task: Task)
    func notesViewController(notesViewController: NotesViewController, didDeleteTask task: Task)
}
