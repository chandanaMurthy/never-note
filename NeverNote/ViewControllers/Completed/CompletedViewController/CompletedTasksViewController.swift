import Foundation
import UIKit

class CompletedTasksViewController: UIViewController {
    @IBOutlet weak var completedTasksTableView: UITableView!
    weak var delegate: CompletedTasksViewControllerDelegate?
    private let completedViewModel = CompletedViewModel()
    private var searchController = UISearchController(searchResultsController: nil)
    private var noDataLabel: UILabel!
    
    private func setupTableView() {
        completedTasksTableView.delegate = self
        completedTasksTableView.dataSource = self
        completedTasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    private func setupNavigationBar() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 19)]
        navigationItem.title = Constants.COMPLETED
        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes as [NSAttributedString.Key: Any]
    }
    
    private func createUILabel() {
        noDataLabel = UILabel(frame: CGRect(x: 0, y: 30, width: self.view.frame.width, height: view.frame.height))
        noDataLabel.text = Constants.NO_DATA
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = .center
        noDataLabel.font = UIFont(name: Constants.AVENIR_NEXT, size: 20.0)
        noDataLabel.backgroundColor = UIColor.white
        self.view.addSubview(noDataLabel)
    }
   
    func insert(task: Task) {
        completedViewModel.addToCompletedTasks(task: task)
        let indexPath = IndexPath(row: completedViewModel.getCompledTasksCount() - 1, section: 0)
        completedViewModel.addToIndexPathArray(indexPath: indexPath)
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
    
    func checkValueWhileLoading() {
        if completedViewModel.getCompledTasksCount() == 0 {
            hideCompletedTableView(in: completedViewModel)
        } else {
            showCompletedTableView(in: completedViewModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        setupNavigationBar()
        setupTableView()
        integrateSearchBar()
        createUILabel()
        completedViewModel.delegate = self
        checkValueWhileLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        completedTasksTableView.insertRows(at: completedViewModel.getIndexPathArray(), with: .automatic)
        completedViewModel.clearIndexPathArray()
    }
}

extension CompletedTasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return completedViewModel.getFilteredDataCount()
        }
        return completedViewModel.getCompledTasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        cell.textLabel?.font = UIFont(name: Constants.AVENIR_NEXT, size: 18)
        if isFiltering() {
            cell.textLabel?.text = completedViewModel.getFilteredDataName(at: indexPath.row).taskTitle
        } else {
            cell.textLabel?.text = completedViewModel.getCompletedTaskName(at: indexPath.row).taskTitle
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func removeTaskWhileFiltering(at indexPath: IndexPath) {
        completedViewModel.removeFromFilteredData(at: indexPath.row)
        completedViewModel.removeFromCompletedTasks(at: completedViewModel.getIndex(at: indexPath.row))
        completedViewModel.removeFromIndexArray(at: indexPath.row)
        completedTasksTableView.deleteRows(at: [indexPath], with: .fade)
        completedTasksTableView.reloadData()
    }
    
    func removeTaskWhileNotFiltering(at indexPath: IndexPath) {
        completedViewModel.removeFromCompletedTasks(at: indexPath.row)
        completedTasksTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let undone = UIContextualAction(style: .normal, title: Constants.MARK_AS_UNDONE) { [weak self](_:UIContextualAction, _:UIView, success: (Bool) -> Void) in
            guard let weakSelf = self else {
                return
            }
            if weakSelf.isFiltering() {
                weakSelf.updateSearchResults(for: weakSelf.searchController)
                let currentTask = weakSelf.completedViewModel.getCompletedTaskName(at: weakSelf.completedViewModel.getIndex(at: indexPath.row))
                weakSelf.delegate?.completedTasksViewController(completedTaskViewController: weakSelf, didMarkUndone: currentTask)
                weakSelf.removeTaskWhileFiltering(at: indexPath)
            } else {
                weakSelf.delegate?.completedTasksViewController(completedTaskViewController: weakSelf, didMarkUndone: weakSelf.completedViewModel.getCompletedTaskName(at: indexPath.row))
                weakSelf.removeTaskWhileNotFiltering(at: indexPath)
            }
            success(true)
        }
        return UISwipeActionsConfiguration(actions: [undone])
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if isFiltering() {
                updateSearchResults(for: searchController)
                delegate?.completedTasksViewController(completedTaskViewController: self, didDelete: completedViewModel.getCompletedTaskName(at: completedViewModel.getIndex(at: indexPath.row)))
                removeTaskWhileFiltering(at: indexPath)
            } else {
                delegate?.completedTasksViewController(completedTaskViewController: self, didDelete: completedViewModel.getCompletedTaskName(at: indexPath.row))
                removeTaskWhileNotFiltering(at: indexPath)
            }
            completedTasksTableView.reloadData()
        }
    }
}

extension CompletedTasksViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        for index in 0..<completedViewModel.getCompledTasksCount() {
            if completedViewModel.getCompletedTaskName(at: index).taskTitle.lowercased().contains(searchText.lowercased()) {
                completedViewModel.addToFilteredData(task: completedViewModel.getCompletedTaskName(at: index))
                completedViewModel.addToIndexArray(index: index)
            }
        }
        completedTasksTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        completedViewModel.clearIndexArray()
        completedViewModel.clearFilteredData()
        filterContentForSearchText(searchText)
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension CompletedTasksViewController: CompletedViewModelDelegate {
    func hideCompletedTableView(in completedViewModel: CompletedViewModel) {
        completedTasksTableView.isHidden = true
        noDataLabel.isHidden = false
    }
    
    func showCompletedTableView(in completedViewModel: CompletedViewModel) {
        completedTasksTableView.isHidden = false
        noDataLabel.isHidden = true
    }
}

protocol CompletedTasksViewControllerDelegate: class {
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didDelete task: Task)
    
    func completedTasksViewController(completedTaskViewController: CompletedTasksViewController, didMarkUndone task: Task)
}
