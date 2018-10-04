import Foundation
import UIKit

class AddScreenViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var taskTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    weak var delegate: AddScreenViewControllerDelegate?
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let task = Task(taskTitle: titleTextField.text!, taskDetails: taskTextView.text)
        delegate?.addScreenViewController(addScreenViewController: self, didCreate: task)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func implementTextViewPlaceholder() {
        taskTextView.text = Constants.PLACEHOLDER_TEXTVIEW
        taskTextView.textColor = UIColor.lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTextView.delegate = self
        implementTextViewPlaceholder()
    }
}

extension AddScreenViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = Constants.PLACEHOLDER_TEXTVIEW
            textView.textColor = UIColor.lightGray
        }
    }
}

protocol AddScreenViewControllerDelegate: class {
    func addScreenViewController(addScreenViewController: AddScreenViewController, didCreate task: Task)
}
