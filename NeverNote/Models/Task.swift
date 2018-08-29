//
//  TaskData.swift
//  NeverNote
//
//  Created by Aditya on 8/29/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

class Task {
    init(taskTitle: String, taskDetails: String) {
        self.taskTitle = taskTitle
        self.taskDetails = taskDetails
    }
    var taskTitle: String
    var taskDetails: String
}
