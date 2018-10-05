import Foundation
import UIKit

class AddScreenViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var taskTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    weak var delegate: AddScreenViewControllerDelegate?
    private let EMPTY = "Empty!"
    private let EMPTY_MESSAGE = "Title Cannot be Empty"
    
    func popupToast(message: String) {
        let messageVC = UIAlertController(title: EMPTY, message: message, preferredStyle: .actionSheet)
        self.present(messageVC, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                messageVC.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        guard let taskTitle = titleTextField.text else {
            return
        }
        if taskTitle.isEmpty {
            popupToast(message: EMPTY_MESSAGE)
        } else {
            let task = Task(taskTitle: taskTitle, taskDetails: taskTextView.text)
            delegate?.addScreenViewController(addScreenViewController: self, didCreate: task)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol AddScreenViewControllerDelegate: class {
    func addScreenViewController(addScreenViewController: AddScreenViewController, didCreate task: Task)
}
