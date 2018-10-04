//
//  RegisterViewController.swift
//  NeverNote
//
//  Created by Chandana on 10/3/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    private let serviceManager = Service()
    private let registerViewModel = RegisterViewModel()
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    func loadHomeScreen() {
        let homeTabBarController = UIViewController.home
        self.present(homeTabBarController, animated: true, completion: nil)
    }
    
    func loadLoginScreen() {
        let loginViewController = UIViewController.login
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    func popupToast(title: String, message: String) {
        let messageVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        self.present(messageVC, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                messageVC.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    func passwordFieldsAreEqual() -> Bool {
        if passwordTextField.text == confirmPasswordTextField.text {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func didTapConfirmButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        if !passwordFieldsAreEqual() {
            popupToast(title: Constants.ERROR, message: registerViewModel.NOT_MATCHING)
            passwordTextField.text = nil
            confirmPasswordTextField.text = nil
        } else {
            serviceManager.register(email: email, password: password) { (status) in
                switch status {
                case Constants.TRUE:
                    self.loadLoginScreen()
                    self.popupToast(title: self.registerViewModel.SUCCESSFUL_REGISTRATION, message: self.registerViewModel.SUCCESS_MESSAGE)
                case Constants.FALSE:
                    self.popupToast(title: Constants.ERROR, message: Constants.ERROR_MESSAGE)
                case Constants.FAILURE:
                    self.popupToast(title: Constants.ERROR, message: Constants.SERVER_ERROR)
                default:
                    self.popupToast(title: Constants.ERROR, message: Constants.ERROR_MESSAGE)
                }
            }
        }
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title: self.registerViewModel.CANCEL, message: self.registerViewModel.CANCEL_MESSAGE, preferredStyle: .alert)
        let okAction = UIAlertAction(title: self.registerViewModel.CONFIRM, style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.loadLoginScreen()
        }
        let cancelAction = UIAlertAction(title: self.registerViewModel.REJECT, style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Dismissed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        showAlertController()
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
