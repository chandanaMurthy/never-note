
import Foundation
import UIKit

class SettingsViewController : UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    var settingsList = [String]()
    
    func setupTableView() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.REUSE_IDENTIFIER)
    }
    
    func addIntoTableView() {
        settingsList.append("Change Password")
        settingsList.append("Change Profile Picture")
        let indexPath = IndexPath(row: settingsList.count-1, section: 0)
        self.settingsTableView.insertRows(at: [indexPath], with: .top)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = Constants.SETTINGS
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setupTableView()
        addIntoTableView()
    }
}

extension SettingsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func configureCell(cell : UITableViewCell, indexPath : IndexPath) {
        cell.textLabel?.text = settingsList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSE_IDENTIFIER, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
