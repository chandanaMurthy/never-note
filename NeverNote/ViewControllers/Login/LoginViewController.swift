//
//  Login.swift
//  NeverNote
//
//  Created by Chandana on 10/1/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    private let service = Service()
    private let INVALID = "Invalid Email Or Password. Please Try Again"
    
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
        rotateImage()
    }
    
    func rotateImage() {
        UIView.animate(withDuration: 2) {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
    
    func loadHomeScreen() {
        let homeTabBarController = UIViewController.home
        self.present(homeTabBarController, animated: true, completion: nil)
    }
    
    func popupToast(message: String) {
        let messageVC = UIAlertController(title: Constants.ERROR, message: message, preferredStyle: .actionSheet)
        self.present(messageVC, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                messageVC.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        service.loginUser(email: email, password: password) { (status) in
            switch status {
            case Constants.TRUE:
                self.loadHomeScreen()
            case Constants.FALSE:
                self.popupToast(message: self.INVALID)
            case Constants.FAILURE:
                self.popupToast(message: Constants.SERVER_ERROR)
            default:
                self.popupToast(message: Constants.ERROR_MESSAGE)
            }
        }
    }
    
    func loadRegisterScreen() {
        let registerViewController = UIViewController.register
        self.present(registerViewController, animated: true, completion: nil)
    }
    
    @IBAction func didTapRegisterButton(_ sender: Any) {
        loadRegisterScreen()
    }
}
