
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
    }
    
}
