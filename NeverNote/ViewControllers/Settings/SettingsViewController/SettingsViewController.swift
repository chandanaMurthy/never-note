import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    private let settingsViewModel = SettingsViewModel()
    private var searchController = UISearchController(searchResultsController: nil)
    
    func setupTableView() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    func addIntoTableView() {
        settingsViewModel.addToSettingsList(name: settingsViewModel.PASSWORD)
        settingsViewModel.addToSettingsList(name: settingsViewModel.PROFILE_PICTURE)
        let indexPath = IndexPath(row: settingsViewModel.getSettingsListCount() - 1, section: 0)
        self.settingsTableView.insertRows(at: [indexPath], with: .top)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = Constants.SETTINGS
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.AVENIR_NEXT, size: 19)]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes as [NSAttributedString.Key: Any]
        let rightNavBarButton = UIBarButtonItem(image: UIImage(named: settingsViewModel.LOGOUT)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapLogOutButton))
        self.navigationItem.rightBarButtonItem = rightNavBarButton
    }
    
    func loadLoginScreen() {
        let loginViewController = UIViewController.login
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title: settingsViewModel.LOGOUT, message: settingsViewModel.LOGOUT_MESSAGE, preferredStyle: .alert)
        let okAction = UIAlertAction(title: settingsViewModel.CONFIRM, style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.loadLoginScreen()
        }
        
        let cancelAction = UIAlertAction(title: settingsViewModel.CANCEL, style: UIAlertAction.Style.cancel) {
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
        self.definesPresentationContext = true
        hideKeyboardWhenTappedAround()
        integrateSearchBar()
        configureNavigationBar()
        setupTableView()
        addIntoTableView()
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return settingsViewModel.getFilteredDataCount()
        }
        return settingsViewModel.getSettingsListCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        cell.textLabel?.font = UIFont(name: Constants.AVENIR_NEXT, size: 18)
        if isFiltering() {
            cell.textLabel?.text = settingsViewModel.getFilteredDataName(at: indexPath.row)
        } else {
            cell.textLabel?.text = settingsViewModel.getSettingName(at: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

extension SettingsViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        for index in 0..<settingsViewModel.getSettingsListCount() {
            if settingsViewModel.getSettingName(at: index).lowercased().contains(searchText.lowercased()) {
                settingsViewModel.addToFilteredData(task: settingsViewModel.getSettingName(at: index))
            }
        }
        settingsTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        settingsViewModel.clearFilteredData()
        filterContentForSearchText(searchText)
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}
