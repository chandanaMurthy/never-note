//
//  Service.swift
//  NeverNote
//
//  Created by Chandana on 10/1/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Service {
    func returnStatus(encodingResult: SessionManager.MultipartFormDataEncodingResult, completion: @escaping(String) -> Void) {
        switch encodingResult {
        case .success(let request, _, _):
            request.responseString(completionHandler: { (response) in
                switch response.result.value {
                case "true":
                    completion("true")
                case "false":
                    completion("false")
                case .none:
                    completion("failure")
                case .some:
                    completion("false")
                }
            })
        case .failure:
            completion("failure")
        }
    }
    
    func register(email: String, password: String, completion: @escaping(String) -> Void) {
        guard let encodedEmail = email.data(using: .utf8), let encodedPassword = password.data(using: .utf8) else {
            return
        }
        let registerURL = "http://192.168.0.118:8080/register"
        Alamofire.upload(multipartFormData: { (formData) in
            formData.append(encodedEmail, withName: "email")
            formData.append(encodedPassword, withName: "password")
        }, to: registerURL, method: .post) { (encodingResult) in
            self.returnStatus(encodingResult: encodingResult, completion: { (status) in
                completion(status)
            })
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping(String) -> Void) {
        guard let encodedEmail = email.data(using: .utf8), let encodedPassword = password.data(using: .utf8) else {
            return
        }
        let loginURL = "http://192.168.0.118:8080/login"
        Alamofire.upload(multipartFormData: { (multipart) in
            multipart.append(encodedEmail, withName: "email")
            multipart.append(encodedPassword, withName: "password")
        }, to: loginURL, method: .post) { (encodingResult) in
            self.returnStatus(encodingResult: encodingResult, completion: { (status) in
                completion(status)
            })
        }
    }
}
