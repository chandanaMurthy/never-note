import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    private let settingsViewModel = SettingsViewModel()
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        configureNavigationBar()
        setupTableView()
        addIntoTableView()
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.getSettingsListCount()
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = settingsViewModel.getSettingName(at: indexPath.row)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: Constants.AVENIR_NEXT, size: 18)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
