
import Foundation
import UIKit

class AddScreenViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var taskTextView: UITextView!
    
    weak var delegate: AddScreenViewControllerDelegate?
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let task = Task(taskTitle: titleTextField.text!, taskDetails: taskTextView.text)
        //let task2 = Task(taskTitle: "", taskDetails:"")
        delegate?.addScreenViewController(addScreenViewController: self, didCreate:task)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

protocol AddScreenViewControllerDelegate : class {
    func addScreenViewController(addScreenViewController : AddScreenViewController, didCreate task : Task)
}
