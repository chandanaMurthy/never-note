
import Foundation
import UIKit

class AddScreenViewController: UIViewController {
    
    @IBOutlet weak var titletextField: UITextField!
    @IBOutlet weak var taskTextView: UITextView!
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddScreenNavBar()
    }
    
    func configureAddScreenNavBar() {
        self.navigationItem.title = Constants.ADD_SCREEN
        let addNoteButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(addNoteButtonTapped))
        self.navigationItem.rightBarButtonItem = addNoteButton
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(cancelButtonnTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelButtonnTapped() {
    }
    
    @objc func addNoteButtonTapped() {
        
    }
    
}
