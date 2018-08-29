//
//  SampleViewController.swift
//  NeverNote
//
//  Created by Aditya on 8/29/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func animationFunction() {
        let animationType:  CABasicAnimation = CABasicAnimation(keyPath: "position")
        animationType.duration = 0.05
        animationType.repeatCount = 8
        animationType.autoreverses = true
        animationType.fromValue = NSValue(cgPoint: CGPoint(x: self.view.center.x - 20, y: self.view.center.y))
        animationType.toValue = NSValue(cgPoint: CGPoint(x: self.view.center.x + 20, y: self.view.center.y))
        self.view.layer.add(animationType, forKey: "position")
    }

}
