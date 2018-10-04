import Foundation
import UIKit

class TrashViewController: UIViewController {
    private let trashViewModel = TrashViewModel()
    @IBOutlet private weak var trashTableView: UITableView!
    weak var delegate: TrashViewControllerDelegate?
    private var noDataLabel: UILabel!
    private var searchController = UISearchController(searchResultsController: nil)
    
    private func setupTableView() {
        trashTableView.delegate = self
        trashTableView.dataSource = self
        self.definesPresentationContext = true
    }

    private func setupNavigationBar() {
        self.navigationItem.title = Constants.TRASH
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 19)]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes as [NSAttributedString.Key: Any]
        let rightNavBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(didTapRightBarButton))
        rightNavBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        if trashViewModel.getDeletedTasksCount() == 0 {
            rightNavBarButton.isEnabled = false
        }
    }
    
    @objc func didTapRightBarButton() {
        searchController.isActive = false
        let alertController = UIAlertController(title: trashViewModel.DELETE, message: trashViewModel.ALERT_MESSAGE, preferredStyle: .alert)
        let okAction = UIAlertAction(title: trashViewModel.CONFIRM, style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.trashViewModel.clearDeletedTasks()
            self.trashTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: trashViewModel.CANCEL, style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Cancel Pressed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func createUILabel() {
        noDataLabel = UILabel(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height))
        noDataLabel.text = Constants.NO_DATA
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = .center
        noDataLabel.font = UIFont(name: Constants.AVENIR_NEXT, size: 20.0)
        noDataLabel.backgroundColor = UIColor.white
        self.view.addSubview(noDataLabel)
    }
    
    func insert(task: Task) {
        trashViewModel.addToInsertTasks(task: task)
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
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupNavigationBar()
        setupTableView()
        integrateSearchBar()
        createUILabel()
        trashViewModel.delegate = self
        insertNewTasks(tasks: trashViewModel.getTasksToInsert())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.insertNewTasks(tasks: trashViewModel.getTasksToInsert())
    }
    
    func insertNewTasks(tasks: [Task]) {
        let indexPaths = generateIndexPaths(from: tasks)
        self.trashTableView.insertRows(at: indexPaths, with: .automatic)
        trashViewModel.clearInsertTasksArray()
    }
    
    func generateIndexPaths(from: [Task]) -> [IndexPath] {
        return trashViewModel.getTasksToInsert().map { (task) -> IndexPath in
            trashViewModel.addToDeletedTasks(task: task)
            return IndexPath(row: trashViewModel.getDeletedTasksCount() - 1, section: 0)
        }
    }
    
    func append(task: Task) {
        trashViewModel.addToInsertTasks(task: task)
    }
}

extension TrashViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return trashViewModel.getFilteredDataCount()
        }
        return trashViewModel.getDeletedTasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        cell.textLabel?.font = UIFont(name: Constants.AVENIR_NEXT, size: 18)
        if isFiltering() {
            cell.textLabel?.text = trashViewModel.getFilteredDataName(at: indexPath.row).taskTitle
            cell.detailTextLabel?.text = trashViewModel.getFilteredDataName(at: indexPath.row).taskDetails
        } else {
            cell.textLabel?.text = trashViewModel.getDeletedTaskName(at: indexPath.row).taskTitle
            cell.detailTextLabel?.text = trashViewModel.getDeletedTaskName(at: indexPath.row).taskDetails
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func removeTaskWhileFiltering(at indexPath: IndexPath) {
        trashViewModel.removeFromFilteredData(at: indexPath.row)
        trashViewModel.removeFromDeletedTasks(at: trashViewModel.getIndex(at: indexPath.row))
        trashViewModel.removeFromIndexArray(at: indexPath.row)
        trashTableView.deleteRows(at: [indexPath], with: .fade)
        trashTableView.reloadData()
    }
    
    func removeTaskWhileNotFiltering(at indexPath: IndexPath) {
        trashViewModel.removeFromDeletedTasks(at: indexPath.row)
        trashTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if isFiltering() {
                updateSearchResults(for: searchController)
                removeTaskWhileFiltering(at: indexPath)
            } else {
                removeTaskWhileNotFiltering(at: indexPath)
            }
            trashTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let undone = UIContextualAction(style: .normal, title: Constants.MARK_AS_UNDONE) { [weak self](_:UIContextualAction, _:UIView, success: (Bool) -> Void) in
            guard let weakSelf = self else {
                return
            }
            if weakSelf.isFiltering() {
                weakSelf.updateSearchResults(for: weakSelf.searchController)
                let deletedTask = weakSelf.trashViewModel.getDeletedTaskName(at: weakSelf.trashViewModel.getIndex(at: indexPath.row))
                weakSelf.delegate?.trashViewController(trashViewController: weakSelf, didMarkUndone: deletedTask)
                weakSelf.removeTaskWhileFiltering(at: indexPath)
            } else {
                weakSelf.delegate?.trashViewController(trashViewController: weakSelf, didMarkUndone: weakSelf.trashViewModel.getDeletedTaskName(at: indexPath.row))
                weakSelf.removeTaskWhileNotFiltering(at: indexPath)
            }
            success(true)
        }
        return UISwipeActionsConfiguration(actions: [undone])
    }
}

extension TrashViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        for index in 0..<trashViewModel.getDeletedTasksCount() {
            if trashViewModel.getDeletedTaskName(at: index).taskTitle.lowercased().contains(searchText.lowercased()) {
                trashViewModel.addToFilteredData(task: trashViewModel.getDeletedTaskName(at: index))
                trashViewModel.addToIndexArray(index: index)
            }
        }
        trashTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        trashViewModel.clearIndexArray()
        trashViewModel.clearFilteredData()
        filterContentForSearchText(searchText)
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

protocol TrashViewControllerDelegate: class {
    func trashViewController(trashViewController: TrashViewController, didMarkUndone task: Task)
}

extension TrashViewController: TrashViewModelDelegate {
    func hideTrashTableView(in trashViewModel: TrashViewModel) {
        trashTableView.isHidden = true
        noDataLabel.isHidden = false
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func showTrashTableView(in trashViewModel: TrashViewModel) {
        trashTableView.isHidden = false
        noDataLabel.isHidden = true
        self.navigationItem.rightBarButtonItem?.isEnabled = true
    }    
}
