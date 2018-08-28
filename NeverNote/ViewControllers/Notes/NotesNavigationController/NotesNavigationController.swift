//
//  NotesNavigationController.swift
//  NeverNote
//
//  Created by Aditya on 8/27/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class NotesNavigationController: UINavigationController {
    let notesViewController = UIViewController.notes
    let addScreenViewController = UIViewController.addScreen

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [notesViewController]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
